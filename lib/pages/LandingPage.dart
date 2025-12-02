import 'package:flutter/material.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageBody(),
    );
  }


  Widget _pageBody() {
    return const Center(
      child: Text('Landing Page'),
    );
  }
}