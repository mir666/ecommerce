import 'package:ecommerce/core/extensions/localization_extension.dart';
import 'package:ecommerce/features/common/controllers/main_bottom_nav_bar_controller.dart';
import 'package:ecommerce/features/common/widget/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesListScreen extends StatefulWidget {
  const CategoriesListScreen({super.key});

  @override
  State<CategoriesListScreen> createState() => _CategoriesListScreenState();
}

class _CategoriesListScreenState extends State<CategoriesListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => Get.find<MainBottomNavBarController>().backToHome(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios_rounded),
          ),
          title: Text(context.localization.category),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return FittedBox(
                child: Column(
                  children: [
                    CategoryItem(
                      icon: Icons.monitor,
                      title: context.localization.electronics,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
