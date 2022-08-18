import 'package:flutter/material.dart';
import 'package:login_stateful/src/screens.dart/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Log Me In',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
