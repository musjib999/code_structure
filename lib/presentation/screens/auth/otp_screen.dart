import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => const OtpScreen());
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
