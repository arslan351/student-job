import 'package:flutter/material.dart';
import 'package:student_jobs/views/widgets/TwoDigitInput.dart';

class PhoneForm extends StatefulWidget{
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
  State<PhoneForm> createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  bool isAllFieldsFilled = false;

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

        TwoDigitInputs(fieldCount: 5, onChanged: (value)=>setState(() {
          isAllFieldsFilled = value;
        }),),

        const SizedBox(height: 30),

        SizedBox(
          width: double.infinity,
          height: 45,
          child: ElevatedButton(
            onPressed: (widget.isChecked && isAllFieldsFilled) ? widget.onSubmit : null,
            style: ElevatedButton.styleFrom(
              disabledBackgroundColor: Colors.white70,
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
}
