import 'package:flutter/material.dart';

class AddProductReviewScreen extends StatefulWidget {
  const AddProductReviewScreen({super.key});

  static const String name = '/create-review';

  @override
  State<AddProductReviewScreen> createState() => _AddProductReviewScreenState();
}

class _AddProductReviewScreenState extends State<AddProductReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Review'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 60),
          Form(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'First Name',
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: 'Write Review',
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
