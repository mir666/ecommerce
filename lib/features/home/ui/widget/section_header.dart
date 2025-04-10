import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.onTapSeeAll,
  });

  final String title;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.titleMedium?.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: onTapSeeAll,
          child: Text(
            context.localization.seeAll,
            style: textTheme.titleMedium?.copyWith(
              color: AppColors.themeColor,
            ),
          ),
        ),
      ],
    );
  }
}
