import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/product_provider.dart';
import '../../core/constants/sizes.dart';
import '../common/loading_widget.dart';
import '../common/error_widget.dart';
import 'widgets/product_card.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(()async {
      if (!mounted) return;
      Provider.of<ProductProvider>(context, listen: false).loadProducts();
      if (!mounted) return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: LoadingWidget());
        }

        if (provider.errorMessage != null) {
          return Center(
            child: AppErrorWidget(
              message: provider.errorMessage!,
              onRetry: () =>
                  Provider.of<ProductProvider>(context, listen: false).loadProducts(),
            ),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(Sizes.paddingMedium),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.66,
            mainAxisSpacing: Sizes.marginMedium,
            crossAxisSpacing: Sizes.marginMedium,
          ),
          itemCount: provider.products.length,
          itemBuilder: (context, index) {
            final product = provider.products[index];
            return ProductCard(product: product);
          },
        );
      },
    );
  }
}
