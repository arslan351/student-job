import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_jobs/models/AlertInfosModel.dart';
import 'package:student_jobs/providers/authProvider.dart';
import 'package:student_jobs/services/otpService.dart';
import 'package:student_jobs/views/widgets/AlertPopup.dart';
import 'package:student_jobs/views/widgets/MyElevatedButton.dart';
import 'package:student_jobs/views/widgets/MyTextButton.dart';
import 'package:student_jobs/views/widgets/TwoDigitInput.dart';
import '../../../services/dioClient.dart';

class PhoneForm extends ConsumerStatefulWidget {
  final VoidCallback onSubmit;
  final bool isChecked;
  final ValueChanged<bool> onCheckboxChanged;

  const PhoneForm({
    super.key,
    required this.onSubmit,
    required this.isChecked,
    required this.onCheckboxChanged,
  });

  @override
  ConsumerState<PhoneForm> createState() => _PhoneFormState();

}

class _PhoneFormState extends ConsumerState<PhoneForm> {

  final OtpService _otpService =OtpService(DioClient().dio);

  //Map<String, dynamic>? _otpData;
  bool _isLoading = false;

  bool isAllFieldsFilled = false;

  String? _currentPhone;

  String _getPhoneNumber() {
    return _currentPhone!;
  }
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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        const SizedBox(height: 230),
        const Text(
          "Tapez votre numéro",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 12),

        TwoDigitInputs(fieldCount: 5, onChanged: (isComplete,fullValue)=>setState(() {
          isAllFieldsFilled = isComplete;
          _currentPhone = fullValue;
        }),),

        const SizedBox(height: 30),

        MyElevatedButton(onPressed: null,onPressedAsync: (widget.isChecked && isAllFieldsFilled && !_isLoading) ?
            () async{
          await _fetchOtp();

        }: null, backgroundColor: Colors.white, textColor: Color.fromARGB(255, 28, 159, 128), iconList: [
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
        ], borderRadius: 24, height: 45, buttonTextSpan: TextSpan(text :"Se connecter", style :TextStyle(color: Color.fromARGB(255, 28, 159, 128),fontWeight: FontWeight.bold)), ),
        
        const SizedBox(height: 16),

        Row(
          children: [
            Checkbox(
              value: widget.isChecked,
              side: const BorderSide(color: Colors.white),
              activeColor: const Color(0xFFA4D9CC),
              checkColor: const Color(0xFF1C9F80),
              onChanged: (v)=>widget.onCheckboxChanged(v!) ,
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

        MyTextButton(borderColor: Colors.white, padding: EdgeInsets.fromLTRB(24, 16, 24, 16), listIcon: [
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
        ], buttonText: TextSpan(
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
        )),
      ],
    );
  }
}

