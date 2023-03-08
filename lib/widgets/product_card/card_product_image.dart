import 'dart:ui';
import 'package:coffee_delivery_app/resources/values/app_colors.dart';
import 'package:flutter/material.dart';
import '../../resources/values/custom_icons.dart';

class CardProductImage extends StatelessWidget {
  const CardProductImage(
      {super.key, required this.rate, required this.imageUrl});

  final double rate;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) =>
                  Container(),
            ),
          ),
          ClipRRect(
            borderRadius:
                const BorderRadius.only(bottomRight: Radius.circular(20)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(20)),
                ),
                height: 25,
                width: 50,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        CustomIcons.star,
                        color: AppColors.STAR_COLOR,
                        size: 14,
                      ),
                      Expanded(
                        child: Text(
                          rate.toString(),
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
