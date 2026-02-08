import 'package:flutter/material.dart';

class OTPForm extends StatelessWidget {
  final int secondsLeft;
  final bool canResend;
  final VoidCallback? onResend;
  final VoidCallback? onConfirm;

  const OTPForm({
    super.key,
    required this.secondsLeft,
    required this.canResend,
    this.onResend,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 150),
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
            onPressed: onConfirm,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: const Text(
              "Confirmer",
              style: TextStyle(
                color: Color(0xFF1C9F80),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 25),
        TextButton(
          onPressed: canResend ? onResend : null,
          child: Text(
            canResend ? "Renvoyer OTP" : "Renvoyer ( $secondsLeft s )",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
