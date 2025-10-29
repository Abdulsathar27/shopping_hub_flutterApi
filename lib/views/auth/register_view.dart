import 'package:flutter/material.dart';
import '../../core/constants/sizes.dart';
import 'widgets/register_header.dart';
import 'widgets/register_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Sizes.paddingLarge),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegisterHeader(),
              SizedBox(height: Sizes.spacingLarge * 2),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
