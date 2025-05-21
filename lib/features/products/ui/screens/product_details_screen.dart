import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/core/extensions/localization_extension.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce/features/products/ui/screens/product_review_screen.dart';
import 'package:ecommerce/features/products/ui/widgets/color_picker.dart';
import 'package:ecommerce/features/products/ui/widgets/increment_decrement_count.dart';
import 'package:ecommerce/features/products/ui/widgets/product_image_carousel_slider.dart';
import 'package:ecommerce/features/products/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localization.productDetails),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProductImageCarouselSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    context.localization
                                        .happyNewYearSpecialDealSave,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 20,
                                          ),
                                          Text(context
                                              .localization.productRating),
                                        ],
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context,
                                              ProductReviewScreen.name);
                                        },
                                        child: Text(
                                          context.localization.review,
                                          style: const TextStyle(
                                            color: AppColors.themeColor,
                                          ),
                                        ),
                                      ),
                                      Card(
                                        color: AppColors.themeColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Icon(
                                            Icons.favorite_border,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IncrementDecrementCount(
                              onChange: (int value) {
                                print(value);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ColorPicker(
                          colors: [
                            context.localization.red,
                            context.localization.white,
                            context.localization.blue,
                            context.localization.black,
                            context.localization.pink,
                          ],
                          onChang: (selectedColor) {
                            print(selectedColor);
                          },
                        ),
                        const SizedBox(height: 16),
                        SizePicker(
                          size: [
                            context.localization.smallSize,
                            context.localization.mediumSize,
                            context.localization.largeSize,
                            context.localization.extraLargeSize,
                          ],
                          onChang: (selectedColor) {
                            print(selectedColor);
                          },
                        ),
                        const SizedBox(height: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.localization.productDescriptionTitle,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              context.localization.productDescriptionTDetails,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildPriceAndAddToCartSection(),
        ],
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.localization.cartPriceTitle),
              Text(
                context.localization.cartPriceCount,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, SignUpScreen.name);
              },
              child: Text(context.localization.addToCart),
            ),
          ),
        ],
      ),
    );
  }
}
