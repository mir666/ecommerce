import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/features/products/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, ProductListScreen.name, arguments: 'Electronics');
        },
        child: Column(
          children: [
            Card(
              color: AppColors.themeColor.withOpacity(0.15),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Icon(
                  icon,
                  color: AppColors.themeColor,
                  size: 48,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.themeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
