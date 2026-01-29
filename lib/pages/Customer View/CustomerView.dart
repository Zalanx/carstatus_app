import 'package:carstatus_app/components/cs_appbar.dart';
import 'package:carstatus_app/components/cs_scaffold.dart';
import 'package:carstatus_app/components/cs_text.dart';
import 'package:flutter/material.dart';

class CustomerViewPage extends StatelessWidget {
  const CustomerViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CsScaffold(
      appBar: 
        CsAppbar(pageTitle: "", backButton: true), 
        body: _pageBody(context),
    );
  }


  Widget _pageBody(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Center(child: Text("Kundenansicht")),
        ],
      ),
    );
  }
}