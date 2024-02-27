import 'package:template/presentation/screens/dashboard/menu_screen.dart';
import 'package:template/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth/bloc/auth_bloc.dart';
import 'auth/auth.dart';

class SplashScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const SplashScreen());
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status.isAuthenticated) {
          Navigator.of(context).pushReplacement(AppMenu.route());
        } else {
          Navigator.of(context).pushReplacement(LoginScreen.route());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.logo,
                width: 270,
                height: 260,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
