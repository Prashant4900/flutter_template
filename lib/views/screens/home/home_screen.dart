import 'package:flutter/material.dart';
import 'package:flutter_template/common/extensions.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.lang.homeScreen)),
      body: Center(child: Text(context.lang.helloWorld)),
    );
  }
}
