import 'package:coffee_delivery_app/resources/values/app_colors.dart';
import 'package:flutter/material.dart';

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
          Container(
            decoration: const BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
            ),
            height: 25,
            width: 50,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: AppColors.STAR_COLOR,
                    size: 18,
                  ),
                  Expanded(
                    child: Text(
                      rate.toString(),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
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
