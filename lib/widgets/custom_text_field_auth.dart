import 'package:flutter/material.dart';

import '../styles/colors.dart';

// ignore: must_be_immutable
class CustomFormTextFieldAuth extends StatelessWidget {
  CustomFormTextFieldAuth({Key? key,
    this.hintText,
    this.text,
    this.keyboardType,
    this.onChanged,
    this.obscureText =false
  }) : super(key: key);

  String? hintText;
  final TextInputType? keyboardType;
  String? text;
  Function(String)? onChanged;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
           Text(text!),
          const SizedBox(height: 10,),
          TextFormField(
            cursorColor: primaryColor,
            keyboardType: keyboardType,
            obscureText:obscureText!,
            validator: (data) {
              if (data!.isEmpty) {
                return 'field is required';
              }
            },
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.black,
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}