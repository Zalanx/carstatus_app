import 'package:flutter/material.dart';

class CsScaffold extends StatelessWidget {
  const CsScaffold({super.key, required this.body, this.padding});

  final Widget body;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Padding(padding: padding ?? _pageInsets(), child: body),
      ),
    );
  }
}

EdgeInsets _pageInsets() {
  return const EdgeInsets.only(left: 14, right: 14, top: 12, bottom: 0);
}
