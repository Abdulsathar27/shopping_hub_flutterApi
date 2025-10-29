import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/smartphone_provider.dart';
import '../../core/constants/sizes.dart';
import '../common/loading_widget.dart';
import '../common/error_widget.dart';
import 'widgets/smartphone_card.dart';

class SmartphoneListView extends StatelessWidget {
  const SmartphoneListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SmartphoneProvider>(
      builder: (context, provider, child) {
        /// Auto Fetch Data if Empty and not loading
        if (provider.smartphones.isEmpty && !provider.isLoading) {
          provider.loadSmartphones();
        }

        if (provider.isLoading) {
          return const Center(child: LoadingWidget());
        }

        if (provider.errorMessage != null) {
          return Center(
            child: AppErrorWidget(
              message: provider.errorMessage!,
              onRetry: () => provider.loadSmartphones(),
            ),
          );
        }

        /// Grid View of Smartphones
        return GridView.builder(
          padding: const EdgeInsets.all(Sizes.paddingMedium),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.66,
            mainAxisSpacing: Sizes.marginMedium,
            crossAxisSpacing: Sizes.marginMedium,
          ),
          itemCount: provider.smartphones.length,
          itemBuilder: (context, index) {
            final product = provider.smartphones[index];
            return SmartphoneCard(product: product);
          },
        );
      },
    );
  }
}
