import 'package:flutter/material.dart';
import '../../core/constants/sizes.dart';
import 'widgets/login_header.dart';
import 'widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Sizes.paddingLarge),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginHeader(),
              SizedBox(height: Sizes.spacingLarge * 2),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
