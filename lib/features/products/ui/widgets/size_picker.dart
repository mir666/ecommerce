import 'package:ecommerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.size, required this.onChang});

  final List<String> size;
  final Function(String) onChang;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Size',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.size.length,
            itemBuilder: (context, index) {
              String color = widget.size[index];
              return GestureDetector(
                onTap: () {
                  selectedColor = color;
                  setState(() {});
                },
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  margin: const EdgeInsets.only(right: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: selectedColor == color ? AppColors.themeColor : null,
                  ),
                  child: Text(
                    color,
                    style: TextStyle(
                      color:
                          selectedColor == color ? Colors.white : null,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
