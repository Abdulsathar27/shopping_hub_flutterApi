import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/auth_provider.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/route_constants.dart';
import 'login_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    /// 🔥 Auto-clear inputs whenever login screen is opened
    emailController.clear();
    passwordController.clear();
  }

  Future<void> _login(BuildContext context) async {
    final auth = Provider.of<AuthProvider>(context, listen: false);

    final success = await auth.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    if (!context.mounted) return;

    if (success) {
      Navigator.pushReplacementNamed(context, RouteConstants.home);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.error,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.radiusLarge),
          ),
          margin: const EdgeInsets.all(Sizes.marginMedium),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.warning_amber_rounded, color: Colors.white),
              const SizedBox(width: Sizes.spacingSmall),
              Text(
                "Invalid login details",
                style: AppTextStyles.subtitle.copyWith(color: Colors.white),
              ),
            ],
          ),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Email",
            prefixIcon: Icon(Icons.email, color: AppColors.textMedium),
          ),
          style: AppTextStyles.body,
        ),
        const SizedBox(height: Sizes.spacingLarge),

        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
            prefixIcon: Icon(Icons.lock, color: AppColors.textMedium),
          ),
          style: AppTextStyles.body,
        ),
        const SizedBox(height: Sizes.spacingLarge * 2),

        LoginButton(onTap: () => _login(context)),

        const SizedBox(height: Sizes.spacingLarge),

        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteConstants.register);
          },
          child: const Text("Create a new account"),
        ),
      ],
    );
  }
}
