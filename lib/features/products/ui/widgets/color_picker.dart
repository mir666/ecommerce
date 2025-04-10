import 'package:ecommerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colors, required this.onChang});

  final List<String> colors;
  final Function(String) onChang;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Colors',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.colors.length,
            itemBuilder: (context, index) {
              String color = widget.colors[index];
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
