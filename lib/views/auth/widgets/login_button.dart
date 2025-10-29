import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/auth_provider.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onTap;
  const LoginButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        if (auth.isLoading) {
          return const CircularProgressIndicator();
        }
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onTap,
            child: const Text("Login"),
          ),
        );
      },
    );
  }
}
