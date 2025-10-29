import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_provider.dart';
import '../../core/constants/sizes.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/route_constants.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Sizes.paddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Profile email (fetched from SharedPreferences)
            Text(
              "Logged in as:",
              style: AppTextStyles.subtitle,
            ),
            const SizedBox(height: Sizes.spacingSmall),
            Text(
              authProvider.userEmail ?? "Unknown User",
              style: AppTextStyles.heading2,
            ),
            const SizedBox(height: Sizes.spacingLarge * 2),

            /// Logout button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await authProvider.logout();
                  if (!context.mounted) return;
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteConstants.login,
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                ),
                child: const Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
