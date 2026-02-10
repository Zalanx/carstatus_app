import 'package:flutter/material.dart';

class CsContainer extends StatelessWidget{
  final Widget child;
  final BoxDecoration? decoration;
  final EdgeInsets? padding;
  final double? height;
  final double? width;

  const CsContainer({
    super.key,
    required this.child,
    this.decoration,
    this.padding, this.height, this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding ?? EdgeInsets.all(12),
      decoration: decoration ?? BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.redAccent),
      child: child,
    );
  }
}