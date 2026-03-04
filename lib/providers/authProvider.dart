import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

// ── Keys ─────────────────────────────────────────────
const String _prefKeyPhone       = 'auth_phone';
const String _prefKeyToken       = 'auth_token';
const String _prefKeyIsAuth      = 'auth_is_authenticated';

// ── Providers ────────────────────────────────────────
final phoneNumberProvider = StateProvider<String?>((ref) => null);

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>(
      (ref) => AuthNotifier(),
);

// ── State ────────────────────────────────────────────
class AuthState {
  final String? phone;
  final String? token;
  final bool isAuthenticated;

  AuthState({
    this.phone,
    this.token,
    this.isAuthenticated = false,
  });

  AuthState copyWith({
    String? phone,
    String? token,
    bool? isAuthenticated,
  }) {
    return AuthState(
      phone: phone ?? this.phone,
      token: token ?? this.token,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  // For persistence
  Map<String, dynamic> toJson() => {
    'phone': phone,
    'token': token,
    'isAuthenticated': isAuthenticated,
  };

  factory AuthState.fromJson(Map<String, dynamic> json) {
    return AuthState(
      phone: json['phone'] as String?,
      token: json['token'] as String?,
      isAuthenticated: json['isAuthenticated'] as bool? ?? false,
    );
  }
}

// ── Notifier ─────────────────────────────────────────
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState()) {
    _loadFromPrefs();
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString('auth_state');
    if (jsonStr != null) {
      try {
        final json = Map<String, dynamic>.from(jsonEncode(jsonStr) as Map<dynamic, dynamic>);
        state = AuthState.fromJson(json);
      } catch (_) {
        // corrupt data → start fresh
      }
    }
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_state', jsonEncode(state.toJson()));
  }

  void setPhone(String phone) {
    state = state.copyWith(phone: phone);
    _saveToPrefs();
  }

  void setOtpSuccess(String token) {
    state = state.copyWith(
      token: token,
      isAuthenticated: true,
    );
    _saveToPrefs();
  }

  Future<void> logout() async {
    state = AuthState(); // reset everything
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_state');

  }
}