import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/phone_form.dart';
import 'widgets/otp_form.dart';

import '../home/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoAnimation;
  late Animation<double> _formOpacity;

  bool _showForm = false;
  bool _showOTP = false;
  bool isChecked = false;

  // OTP resend timer
  Timer? _resendTimer;
  int _resendSeconds = 10;
  bool _canResend = false;

  void _startResendCountdown() {
    _resendTimer?.cancel();
    setState(() {
      _resendSeconds = 10;
      _canResend = false;
    });

    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendSeconds == 1) {
        timer.cancel();
        setState(() {
          _resendSeconds = 0;
          _canResend = true;
        });
      } else {
        setState(() {
          _resendSeconds--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _logoAnimation = Tween<double>(begin: 0, end: -0.9).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
    );

    _formOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1, curve: Curves.easeOut),
      ),
    );

    Future.delayed(const Duration(milliseconds: 1000), () {
      if (!mounted) return;
      _controller.forward().then((_) {
        if (mounted) setState(() => _showForm = true);
      });
    });
  }

  @override
  void dispose() {
    _resendTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF27A99A), Color(0xFF19363A)],
              ),
            ),
          ),

          // Bubbles
          Positioned(
            top: 0,
            left: 0,
            height: 300,
            child: SvgPicture.asset(
              "assets/icons/background_bubbles.svg",
              fit: BoxFit.cover,
            ),
          ),

          // Logo animation
          Align(
            alignment: Alignment.center,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.translate(
                  offset: Offset(0, _logoAnimation.value * 180),
                  child: child,
                );
              },
              child: SvgPicture.asset(
                "assets/icons/logo_white.svg",
                width: 125,
              ),
            ),
          ),

          // Forms
          if (_showForm)
            FadeTransition(
              opacity: _formOpacity,
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 48),
                  child: _showOTP
                      ? OTPForm(
                          secondsLeft: _resendSeconds,
                          canResend: _canResend,
                          onResend: () {
                            _startResendCountdown();
                            // TODO: Call resend OTP API
                          },
                          onConfirm: (){
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder : (_)=> const HomeScreen()),
                            );
                          },
                        )
                      : PhoneForm(
                          isChecked: isChecked,
                          onCheckboxChanged: (v) =>
                              setState(() => isChecked = v),
                          onSubmit: () {
                            setState(() => _showOTP = true);
                            _startResendCountdown();
                          },
                        ),
                ),
              ),
            ),

          // Copyright
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Text(
                "© 2025 DJEZZY",
                style: TextStyle(fontSize: 12, color: Colors.white70),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
