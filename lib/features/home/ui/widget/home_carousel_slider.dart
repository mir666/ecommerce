import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({
    super.key,
  });

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            viewportFraction: 0.90,
            onPageChanged: (index, reason) {
              _selectedIndex = index;
              setState(() {});
            },
          ),
          items: [1, 2, 3, 4, 5].map(
            (i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'text $i',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  );
                },
              );
            },
          ).toList(),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 5; i++)
              Container(
                height: 16,
                width: 16,
                margin: const EdgeInsets.only(left: 4),
                decoration: BoxDecoration(
                  color: _selectedIndex == i ? AppColors.themeColor : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.themeColor),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
