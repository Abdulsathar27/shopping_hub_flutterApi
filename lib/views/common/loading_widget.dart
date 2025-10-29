import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/constants/sizes.dart';
import '../../core/constants/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.textLight.withValues(alpha: 0.3),
      highlightColor:AppColors.textLight.withValues(alpha: 0.1),
      child: GridView.builder(
        padding: const EdgeInsets.all(Sizes.paddingMedium),
        itemCount: 6,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.66,
          crossAxisSpacing: Sizes.marginMedium,
          mainAxisSpacing: Sizes.marginMedium,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(Sizes.radiusMedium),
            ),
          );
        },
      ),
    );
  }
}
