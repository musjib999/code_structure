import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
