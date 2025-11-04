import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/auth_provider.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/route_constants.dart';
import 'register_button.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  static final TextEditingController nameController =
      TextEditingController();
  static final TextEditingController emailController =
      TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();

  Future<void> _register(BuildContext context) async {
    final auth = Provider.of<AuthProvider>(context, listen: false);

    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        nameController.text.isNotEmpty) {
      final success = await auth.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      if (!context.mounted) return;

      if (success) {
        Navigator.pushReplacementNamed(context, RouteConstants.home);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            labelText: "Name",
            prefixIcon: Icon(Icons.person, color: AppColors.textMedium),
          ),
          style: AppTextStyles.body,
        ),
        const SizedBox(height: Sizes.spacingLarge),

        
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

        RegisterButton(onTap: () => _register(context)),
      ],
    );
  }
}
