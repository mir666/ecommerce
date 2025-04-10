import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/core/extensions/localization_extension.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_up_screen.dart';
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
                                  const Text(
                                    'Happy New Year Special Deal Save 30%',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 20,
                                          ),
                                          Text('4.2'),
                                        ],
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text('Review'),
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
                          colors: const [
                            'Red',
                            'White',
                            'Blue',
                            'Black',
                            'Pink'
                          ],
                          onChang: (selectedColor) {
                            print(selectedColor);
                          },
                        ),
                        const SizedBox(height: 16),
                        SizePicker(
                          size: const ['S', 'M', 'L', 'XL'],
                          onChang: (selectedColor) {
                            print(selectedColor);
                          },
                        ),
                        const SizedBox(height: 24),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lip sum generator Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lip sum generator Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lip sum generator.',
                              style: TextStyle(
                                color: Colors.grey
                              ),
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
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price'),
              Text(
                '\$1000',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 140,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, SignUpScreen.name);
              },
              child: const Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
