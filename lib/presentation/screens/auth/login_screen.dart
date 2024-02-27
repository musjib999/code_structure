import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const LoginScreen());
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
