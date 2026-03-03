import 'package:flutter_riverpod/flutter_riverpod.dart';

final phoneNumberProvider = StateProvider<String?>((ref)=> null);

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier());

class AuthState {
  final String? phone;
  final String? token;
  final bool isAuthenticated;

  AuthState({
    this.phone,
    this.token,
    this.isAuthenticated = false,
  });

  AuthState copyWith({String? phone, String? token, bool? isAuthenticated,}){
    return AuthState(
      phone: phone ?? this.phone,
      token: token ?? this.token,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState>{
  AuthNotifier() : super (AuthState());

  void setPhone(String phone) {
    state = state.copyWith(phone: phone);
  }

  void setOtpSuccess(String token) {
    state = state.copyWith(token: token , isAuthenticated: true);
  }

}