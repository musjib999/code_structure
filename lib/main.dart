import 'package:template/presentation/presentation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Template App',
      theme: lightTheme,
      home: const SplashScreen(),
    );
  }
}
