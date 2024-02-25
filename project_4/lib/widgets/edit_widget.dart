import 'package:flutter/material.dart';

class EditWidget extends StatelessWidget {
  const EditWidget({super.key, required this.text1, required this.text2});

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text1,
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xffFFFFFF)),
        ),
        TextFormField(
          style: TextStyle(color: Colors.white),
          minLines: 1,
          maxLines: 30,
          initialValue: text2,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: const Color(0xff2e2e2e),
          ),
        ),
        SizedBox(height: 30,)
      ],
    );
  }
}
