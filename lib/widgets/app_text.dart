import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign? textAlign;
  final int? maxLine;
  final double? hight;
  final Alignment? alignment;

   AppText({
    Key? key,
    this.text,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.textAlign, this.maxLine, this.alignment, this.hight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(alignment: alignment,height: hight,
      child: Text(
        text!,
        maxLines: maxLine,
        textAlign: textAlign == null ? null : TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
