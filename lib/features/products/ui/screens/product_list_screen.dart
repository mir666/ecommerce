import 'package:ecommerce/features/common/widget/product_card.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.category});

  final String category;

  static const String name = '/product-list';

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
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
