import 'package:flutter/material.dart';

class CsText extends StatelessWidget {
  const CsText({super.key, required this.text, this.style, this.size, this.fontWeight});

  final String text;
  final FontStyle? style;
  final double? size;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(text,
                style: TextStyle(
                fontStyle: style ?? FontStyle.italic,
                fontSize: size ?? 16,
                fontWeight: fontWeight ?? FontWeight.bold,
              ),
    );
  }
}