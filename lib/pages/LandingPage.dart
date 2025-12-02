import 'package:carstatus_app/components/cs_button.dart';
import 'package:carstatus_app/components/cs_scaffold.dart';
import 'package:flutter/material.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return CsScaffold(body: _pageBody(context));
  }

  Widget _pageBody(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 150,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              "Welcome to SAMUEL AUTOHAUS!",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CsButton(
                  height: 80,
                  width: 150,
                  borderRadius: BorderRadius.circular(16),
                  child: Text("Login"),
                ),
                CsButton(
                  height: 80,
                  width: 150,
                  borderRadius: BorderRadius.circular(16),
                  child: Text("Register"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
