import 'package:flutter/material.dart';

class CsButton extends StatelessWidget {
  const CsButton({
    super.key,
    required this.height,
    required this.width,
    this.padding,
    this.margin,
    this.borderRadius,
    required this.child,
    this.onTap, this.buttonColor,
  });

  final double height;
  final double width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final Widget child;
  final GestureTapCallback? onTap;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => {},
      child: Container(
        padding: padding,
        margin: margin,
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          border: Border.all(
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        child: child,
      ),
    );
  }
}
