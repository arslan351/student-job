import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TwoDigitInputs extends StatefulWidget {
  final int fieldCount;
  const TwoDigitInputs({super.key, required this.fieldCount});
  @override
  _TwoDigitInputsState createState() => _TwoDigitInputsState();
}

class _TwoDigitInputsState extends State<TwoDigitInputs> {

  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers =List.generate(widget.fieldCount, (_) => TextEditingController());
    focusNodes = List.generate(widget.fieldCount, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in controllers) c.dispose();
    for (var f in focusNodes) f.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.fieldCount, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            width: 35,
            child: TextField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              textAlign: TextAlign.center,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white, fontSize: 16),
              keyboardType: TextInputType.number,
              maxLength: 2,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                counterText: '',
                hintText: "XX",
                hintStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
              ),
              onChanged: (value) {
                if (value.length == 2 && index < widget.fieldCount - 1) {
                  focusNodes[index + 1].requestFocus();
                }

              },
            ),
          ),
        );
      }),
    );
  }
}