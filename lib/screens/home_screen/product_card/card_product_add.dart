import 'package:coffee_delivery_app/resources/values/custom_icons.dart';
import 'package:flutter/material.dart';

import '../../../resources/values/app_colors.dart';

class CardProductAdd extends StatelessWidget {
  const CardProductAdd({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.WHITE_8_OPACITY,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                price.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.SECONDARY_COLOR),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                CustomIcons.add,
                size: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
