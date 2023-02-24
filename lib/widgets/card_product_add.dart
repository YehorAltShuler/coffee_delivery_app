import 'package:flutter/material.dart';

import '../resources/values/app_colors.dart';

class CardProductAdd extends StatelessWidget {
  const CardProductAdd({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.VERY_FADED_SECONDARY_COLOR,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                price.toString(),
                style: Theme.of(context).textTheme.headline5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            height: 45,
            width: 45,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Material(
                color: AppColors.SECONDARY_COLOR,
                child: InkWell(onTap: () {}, child: const Icon(Icons.add)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
