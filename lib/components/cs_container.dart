import 'package:flutter/material.dart';

class CsContainer extends StatelessWidget{
  final Widget child;
  final BoxDecoration? decoration;
  final EdgeInsets? padding;

  const CsContainer({
    super.key,
    required this.child,
    this.decoration,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(12),
      decoration: decoration ?? BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.redAccent),
      child: child,
    );
  }
}