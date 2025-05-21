import 'package:ecommerce/app/assets_path.dart';
import 'package:ecommerce/core/extensions/localization_extension.dart';
import 'package:ecommerce/features/common/controllers/main_bottom_nav_bar_controller.dart';
import 'package:ecommerce/features/home/ui/widget/action_bar_button.dart';
import 'package:ecommerce/features/common/widget/category_item.dart';
import 'package:ecommerce/features/home/ui/widget/home_carousel_slider.dart';
import 'package:ecommerce/features/common/widget/product_card.dart';
import 'package:ecommerce/features/home/ui/widget/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildSearchTextFormField(),
              const SizedBox(height: 16),
              const HomeCarouselSlider(),
              const SizedBox(height: 16),
              SectionHeader(
                title: context.localization.allCategory,
                onTapSeeAll: () {
                  Get.find<MainBottomNavBarController>().moveToCategory();
                },
              ),
              const SizedBox(height: 8),
              _buildCategoriesSection(),
              const SizedBox(height: 16),
              SectionHeader(
                title: context.localization.popular,
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 8),
              _buildProductSection(),
              const SizedBox(height: 16),
              SectionHeader(
                title: context.localization.special,
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 8),
              _buildProductSection(),
              const SizedBox(height: 16),
              SectionHeader(
                title: context.localization.sNew,
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 8),
              _buildProductSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductSection() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ProductCard(),
          SizedBox(width: 8),
          ProductCard(),
          SizedBox(width: 8),
          ProductCard(),
          SizedBox(width: 8),
          ProductCard(),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryItem(
            icon: Icons.monitor,
            title: context.localization.electronics,
          ),
          CategoryItem(
            icon: Icons.monitor,
            title: context.localization.electronics,
          ),
          CategoryItem(
            icon: Icons.monitor,
            title: context.localization.electronics,
          ),
          CategoryItem(
            icon: Icons.monitor,
            title: context.localization.electronics,
          ),
          CategoryItem(
            icon: Icons.monitor,
            title: context.localization.electronics,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchTextFormField() {
    return TextFormField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: context.localization.search,
        prefixIcon: const Icon(Icons.search_outlined),
        fillColor: Colors.grey.shade200,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsPath.logoNavSvg,
        width: 150,
      ),
      actions: [
        ActionBarButton(
          icon: Icons.person_2_outlined,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        ActionBarButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        ActionBarButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
