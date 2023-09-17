import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:exercise_app/screens/active_breaks.dart';
import 'package:flutter/material.dart';

import '../config/all_config.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    super.key,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _index = index;
              });
            },
            viewportFraction: 0.85,
            enlargeFactor: 0.2,
            aspectRatio: 2 / 1,
            autoPlay: true,
          ),
          items: imgList
              .map((item) => Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: CachedNetworkImage(
                          imageUrl: item,
                          fit: BoxFit.fill,
                          width: 1000,
                        )),
                  ))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: _index == entry.key ? 15 : 6,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _index == entry.key
                      ? AppColors.primaryColor
                      : AppColors.subTextColor),
            );
          }).toList(),
        )
      ],
    );
  }
}
