import 'package:flutter/material.dart';

class CsText extends StatelessWidget {
  const CsText({super.key, required this.text, this.style, this.size, this.fontWeight, this.color, this.wordSpacing, this.textAlign, this.decoration, this.decorationThickness});

  final String text;
  final FontStyle? style;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final double? wordSpacing;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final double? decorationThickness;

  @override
  Widget build(BuildContext context) {
    return Text(text,
                style: TextStyle(
                fontStyle: style ?? FontStyle.italic,
                fontSize: size ?? 16,
                fontWeight: fontWeight ?? FontWeight.bold,
                color: color,
                wordSpacing:wordSpacing,
                decoration: decoration,
                decorationThickness: decorationThickness,
              ),
              textAlign: textAlign,

    );
  }
}