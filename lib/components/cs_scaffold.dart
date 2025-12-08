import 'package:carstatus_app/components/cs_appbar.dart';
import 'package:flutter/material.dart';

class CsScaffold extends StatelessWidget {
  const CsScaffold({super.key, required this.body, this.padding, this.appBar, this.backgroundColor});

  final Widget body;
  final EdgeInsetsGeometry? padding;
  final Widget? appBar;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor ?? Colors.white,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 60),
          child: appBar ?? const CsAppbar(pageTitle: "", ),),
        body: Padding(padding: padding ?? _pageInsets(), 
        child: body),
      ),
    );
  }
}

EdgeInsets _pageInsets() {
  return const EdgeInsets.only(left: 14, right: 14, top: 12, bottom: 0);
}
