import 'package:flutter/material.dart';

import '../resources/values/app_colors.dart';
import '../resources/values/app_constants.dart';
import '../resources/values/custom_icons.dart';
import 'coupon_clipper.dart';

class Coupon extends StatelessWidget {
  const Coupon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: const CouponClipper(borderRadius: 1, curvePosition: 10),
      child: Material(
        color: AppColors.COUPON_COLOR,
        child: SizedBox(
          height: 40,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(
                left: AppConstants.k30Padding, right: AppConstants.k12Padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Apply Coupon Code',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: AppColors.SECONDARY_COLOR),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CustomIcons.goArrow,
                      size: 14,
                      color: AppColors.SECONDARY_COLOR,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
