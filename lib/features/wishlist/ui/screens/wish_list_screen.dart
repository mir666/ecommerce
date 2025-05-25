import 'package:ecommerce/core/extensions/localization_extension.dart';
import 'package:ecommerce/features/common/ui/widget/product_card.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localization.wishList),
      ),
      body: GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return const FittedBox(
            child: Column(
              children: [
                ProductCard(),
              ],
            ),
          );
        },
      ),
    );
  }
}
