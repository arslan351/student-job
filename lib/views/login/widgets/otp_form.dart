import 'package:flutter/material.dart';
import 'package:student_jobs/models/AlertInfosModel.dart';
import 'package:student_jobs/services/dioClient.dart';
import 'package:student_jobs/services/otpService.dart';
import 'package:student_jobs/views/widgets/AlertPopup.dart';
import 'package:student_jobs/views/widgets/MyElevatedButton.dart';
import 'package:student_jobs/views/widgets/TwoDigitInput.dart';

class OTPForm extends StatefulWidget {
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
  State<OTPForm> createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  bool isAllFieldsFilled =false;
  bool _isLoading =false;
  final OtpService _otpService =OtpService(DioClient().dio);

  String? _otpValue ;

  String _getOtp (){
    return _otpValue!;
  }

  Future<void> _sendOtp() async {
    setState((){
      _isLoading=true ;
      //_otpData = null;
    });
    final otp = _getOtp().trim();
    final result = await _otpService.fetchOtp(otp);

    setState(() => _isLoading = false);

    if(result.isSuccess){
      widget.onConfirm?.call();
    }else {
      _showDialog(
        context,
        AlertInfosModel(
          imagePath: "assets/icons/bolt.svg",
          title: result.errorMessage ?? "Erreur",
          description: "Veuillez réessayer",
          alertColor: Colors.red,
          buttonList: [
            {"title": "OK", "color": Colors.red},
          ],
        ),
      );
    }
  }

  void _showDialog(BuildContext context, AlertInfosModel alertInfosModel) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.3),
      builder: (BuildContext context) {
        return AlertPopup(alertInfosModel: alertInfosModel);
      },
    );
  }

  /*
  Future<void> _fetchOtp() async {
    setState((){
      _isLoading=true ;
      //_otpData = null;
    });
    final phone = _getPhoneNumber().trim();
    final result = await _otpService.fetchOtp(phone);

    setState(() => _isLoading = false);

    if(result.isSuccess){
      //ref.read(phoneNumberProvider).state = phone;
      ref.read(authStateProvider.notifier).setPhone(phone);
      //setState(() {
        //_otpData = result.data;
      //});
      widget.onSubmit();
    }else {
      _showDialog(
        context,
        AlertInfosModel(
          imagePath: "assets/icons/bolt.svg",
          title: result.errorMessage ?? "Erreur",
          description: "Veuillez réessayer",
          alertColor: Colors.red,
          buttonList: [
            {"title": "OK", "color": Colors.red},
          ],
        ),
      );
    }
  }
  */

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 150),
        const Text(
          "You will receive an SMS with a 6-digit code. Enter it here.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 16),
 
        TwoDigitInputs(fieldCount: 3, onChanged: (isComplete,fullValue)=>setState(() {
          isAllFieldsFilled = isComplete;
          _otpValue = fullValue;
        }),),

        const SizedBox(height: 30),

        MyElevatedButton(backgroundColor: Colors.white, textColor: Color(0xFF1C9F80), iconList: [], buttonTextSpan: TextSpan(text: "Confirmer",style: TextStyle(
          color: Color(0xFF1C9F80),
          fontWeight: FontWeight.bold,
        ),), borderRadius: 24, height: 45,onPressed: null,onPressedAsync: ( isAllFieldsFilled && !_isLoading) ?
            () async{
          await _sendOtp();

        }: null),
        
        const SizedBox(height: 25),
        TextButton(
          onPressed: widget.canResend ? widget.onResend : null,
          child: Text(
            widget.canResend ? "Renvoyer OTP" : "Renvoyer ( ${widget.secondsLeft} s )",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ],
    );
  }


}
