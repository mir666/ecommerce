import 'package:ecommerce/features/categories/ui/screens/categories_list_screen.dart';
import 'package:ecommerce/features/common/controllers/category_controller.dart';
import 'package:ecommerce/features/common/controllers/home_slide_controller.dart';
import 'package:ecommerce/features/common/controllers/main_bottom_nav_bar_controller.dart';
import 'package:ecommerce/features/home/ui/screens/home_screen.dart';
import 'package:ecommerce/features/wishlist/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  static const String name = 'main-bottom-nav-bar';

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {


  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoriesListScreen(),
    const HomeScreen(),
    const WishListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeSliderController>().getSliders();
      Get.find<CategoryController>().getCategoryList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavBarController>(
        builder: (controller) {
          return _screens[controller.selectedIndex];
        }
      ),
      bottomNavigationBar: GetBuilder<MainBottomNavBarController>(
        builder: (controller) {
          return NavigationBar(
            selectedIndex: controller.selectedIndex,
            onDestinationSelected: controller.changIndex,
            destinations: const [
              NavigationDestination(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 28,
                  ),
                  label: 'Home'),
              NavigationDestination(
                  icon: Icon(
                    Icons.category_outlined,
                    size: 28,
                  ),
                  label: 'Category'),
              NavigationDestination(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    size: 28,
                  ),
                  label: 'Cart'),
              NavigationDestination(
                  icon: Icon(
                    Icons.favorite_border,
                    size: 28,
                  ),
                  label: 'Wishlist'),
            ],
          );
        }
      ),
    );
  }
}
