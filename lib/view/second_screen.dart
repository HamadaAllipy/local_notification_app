import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String? pay;
  const SecondScreen({Key? key, required this.pay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          pay??'empty',
        ),
      ),
    );
  }
}
