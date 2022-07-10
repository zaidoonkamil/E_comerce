import 'package:flutter/material.dart';

import '../styles/colors.dart';

class CustomButon extends StatelessWidget {
  final String? text;
  final double roundness;
  final FontWeight fontWeight;
  final VoidCallback? onTap;
  final Color? color;
  final double? fontSize;
  final double? sizeCircular=20;
  final FontWeight? fontweight;
  final TextAlign? textAlign;
  const CustomButon({
    Key? key,
    this.text,
    this.roundness = 18,
    this.fontWeight = FontWeight.bold,
    this.onTap,
    this.color,
    this.fontweight,
    this.fontSize, this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(sizeCircular!),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(text!,textAlign: textAlign,
            style: TextStyle(
            fontSize:fontSize ,fontWeight: fontweight,color: color
          ),),
        ),
      ),
    );
  }
}
