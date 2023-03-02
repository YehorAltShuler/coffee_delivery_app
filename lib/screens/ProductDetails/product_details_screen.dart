import 'dart:ui';

import 'package:coffee_delivery_app/models/product.dart';
import 'package:coffee_delivery_app/resources/values/app_colors.dart';
import 'package:coffee_delivery_app/resources/values/app_constants.dart';
import 'package:coffee_delivery_app/widgets/category_selector.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  static const routeName = '/product-details-screen';

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.kDefaultPadding * 2),
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        product.imageUrl,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          onPressed: Navigator.of(context).pop,
                          icon: const Icon(
                            Icons.arrow_back,
                            color: AppColors.LIGHT_GREY_COLOR,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.kDefaultPadding * 2),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.drinkType,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: AppColors.FAVORITE_COLOR,
                        size: 32,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Text(
                          product.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        )),
                    Flexible(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: AppColors.STAR_COLOR,
                            size: 12,
                          ),
                          Text(
                            product.rate.toString(),
                            style: Theme.of(context).textTheme.labelMedium,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppConstants.kDefaultPadding.toDouble()),
                ReadMoreText(
                  product.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' Read more',
                  trimExpandedText: ' Read less',
                  moreStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  lessStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: AppConstants.k30Padding.toDouble(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choice od milk',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: AppConstants.kDefaultPadding.toDouble(),
                    ),
                    Row(
                      children: [
                        CategorySelector(
                          categories: const [
                            'Oat Milk',
                            'Soy Milk',
                            'Almond Milk'
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            '\$${product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'OpenSans'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'BUY NOW',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: AppColors.BUT_NOW_COLOR,
                                      fontFamily: 'OpenSans'),
                            )),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
