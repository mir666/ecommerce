import 'package:ecommerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class IncrementDecrementCount extends StatefulWidget {
  const IncrementDecrementCount({super.key, required this.onChange});

  final Function(int) onChange;

  @override
  State<IncrementDecrementCount> createState() =>
      _IncrementDecrementCountState();
}

class _IncrementDecrementCountState extends State<IncrementDecrementCount> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if(count <= 1) return;
            count--;
            widget.onChange(count);
            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: AppColors.themeColor,
                borderRadius: BorderRadius.circular(4)),
            child: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          '$count',
          style: const TextStyle(fontSize: 18),
        ),
        GestureDetector(
          onTap: () {
            if(count >= 20) return;
            count++;
            widget.onChange(count);
            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: AppColors.themeColor,
                borderRadius: BorderRadius.circular(4)),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
