import 'package:flutter/material.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/sizes.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Welcome Back", style: AppTextStyles.heading1),
        const SizedBox(height: Sizes.spacingMedium),
        Text("Login to your account", style: AppTextStyles.subtitle),
      ],
    );
  }
}
