import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: const SplashToLoginScreen(),
    );
  }
}

class SplashToLoginScreen extends StatefulWidget {
  const SplashToLoginScreen({super.key});

  @override
  State<SplashToLoginScreen> createState() => _SplashToLoginScreenState();
}

class _SplashToLoginScreenState extends State<SplashToLoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoPositionAnimation;
  late Animation<double> _formOpacityAnimation;

  bool _animationsReady = false;
  bool _showForm = false;

  bool _showOTP = false;
  Timer? _resendTimer;
  int _resendSeconds = 10;
  bool _canResend = false;

  bool isChecked = false;

  void _startResendCountdown() {
    _resendTimer?.cancel();
    setState(() {
      _resendSeconds =10;
      _canResend = false;
    });

    _resendTimer= Timer.periodic(
        const Duration(seconds: 1),
            (timer){
          if (_resendSeconds == 1) {
            timer.cancel();
            setState(() {
              _resendSeconds = 0;
              _canResend = true;
            });
          }else {
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

    _logoPositionAnimation = Tween<double>(begin: 0.0, end: -0.90).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
    );

    _formOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
      ),
    );

    _animationsReady = true;

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

  // =========================
  // PHONE FORM
  // =========================
  Widget _phoneForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 230),
        const Text(
          "Tapez votre numéro",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24.0,
          children: List.generate(
            5,
                (_) => Column(
              children: const [
                Text("XX", style: TextStyle(color: Colors.white)),
                SizedBox(height: 4),
                SizedBox(
                  width: 40,
                  height: 2,
                  child: ColoredBox(color: Colors.white),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 30),

        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              setState(() => _showOTP = true);
              _startResendCountdown();
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.shield,
                        size: 24,
                        color: Color.fromARGB(102, 28, 159, 128),
                      ),
                      Icon(
                        Icons.person,
                        size: 12,
                        color: Color.fromARGB(255, 28, 159, 128),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Se connecter',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 28, 159, 128),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        Row(
          children: [
            Checkbox(
              value: isChecked,
              side: const BorderSide(color: Colors.white),
              activeColor: const Color(0xFFA4D9CC),
              checkColor: const Color(0xFF1C9F80),
              onChanged: (_) => setState(() => isChecked = !isChecked),
            ),
            const Expanded(
              child: Text.rich(
                TextSpan(
                  text: "I confirm that I have read and accepted the ",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  children: [
                    TextSpan(
                      text: "terms of use",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: " and the "),
                    TextSpan(
                      text: "data protection policy",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: "."),
                  ],
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 30),

        TextButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            side: BorderSide(color: Colors.white),
            padding: const EdgeInsets.fromLTRB(32, 24, 32, 24),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8.0,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.remove_red_eye,
                    size: 24,
                    color: Color.fromARGB(
                      255,
                      124,
                      166,
                      164,
                    ), // outer shape #7ca6a4
                  ),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white, // inner pupil
                    ),
                  ),
                ],
              ),
              Text.rich(
                TextSpan(
                  text: "Browse as ",
                  style: TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      text: "Guest",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // =========================
  // OTP FORM
  // =========================
  Widget _otpForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height : 150),
        const Text(
          "You will receive an SMS with a 6-digit code.Enter it here.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24.0,
          children: List.generate(
            3,
                (_) =>  Column(
              children: const [
                Text("XX", style: TextStyle(color: Colors.white)),
                SizedBox(height: 4),
                SizedBox(
                  width: 40,
                  height: 2,
                  child: ColoredBox(color: Colors.white),
                ),
              ],
            ),
          ),
        ),


        const SizedBox(height: 30),

        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: const Text(
              "Confirm",
              style: TextStyle(color: Color(0xFF1C9F80),fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 25),
        TextButton(
            onPressed : _canResend ? (){
              _startResendCountdown();
              // TODO: call resend OTP API here
            } : null ,
            child: Text(
                _canResend ? "Resend OTP" : "Resend ($_resendSeconds) s",
                style :TextStyle(color: Colors.white ,fontSize: 14)
            ))
      ],
    );
  }

  // =========================
  // BUILD
  // =========================
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
          if (_animationsReady)
            Align(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (_, child) {
                  final offsetY = _logoPositionAnimation.value * 180;
                  return Transform.translate(
                    offset: Offset(0, offsetY),
                    child: child,
                  );
                },
                child: SvgPicture.asset(
                  "assets/icons/logo_white.svg",
                  width: 125,
                ),
              ),
            ),

          // FORM (PHONE ↔ OTP)
          if (_showForm)
            FadeTransition(
              opacity: _formOpacityAnimation,
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 48),
                  child: _showOTP ? _otpForm() : _phoneForm(),
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
