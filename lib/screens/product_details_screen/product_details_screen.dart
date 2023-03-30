import 'dart:ui';

import 'package:coffee_delivery_app/models/product.dart';
import 'package:coffee_delivery_app/resources/values/app_colors.dart';
import 'package:coffee_delivery_app/resources/values/app_constants.dart';
import 'package:coffee_delivery_app/widgets/category_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../providers/products_provider.dart';
import '../../resources/values/custom_icons.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  static const routeName = '/product-details-screen';

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context);
    final product = ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              toolbarHeight: 80,
              leadingWidth: 80,
              leading: Padding(
                padding: const EdgeInsets.only(top: 26, left: 24),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                      child: IconButton(
                        onPressed: Navigator.of(context).pop,
                        icon: const Icon(
                          CustomIcons.backArrow,
                          size: 16,
                          color: AppColors.WHITE_70_OPACITY,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              pinned: true,
              backgroundColor: AppColors.PRIMARY_COLOR,
              expandedHeight: MediaQuery.of(context).size.height / 1.45,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding:
                      const EdgeInsets.all(AppConstants.kDefaultPadding * 2),
                  child: Column(
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
                    ],
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(100),
                child: Container(
                  decoration: const BoxDecoration(
                      color: AppColors.PRIMARY_COLOR,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Padding(
                    padding:
                        const EdgeInsets.all(AppConstants.kDefaultPadding * 2),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: AppConstants.kDefaultPadding * 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.drinkType,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Consumer(
                              builder:
                                  (BuildContext context, value, Widget? child) {
                                return IconButton(
                                  onPressed: () {
                                    products.toggleFavorite(product);
                                  },
                                  icon: Icon(
                                    CustomIcons.heart,
                                    color: product.isFavorite
                                        ? AppColors.FAVORITE_COLOR
                                        : AppColors.SECONDARY_COLOR_50_OPACITY,
                                    size: 26,
                                  ),
                                );
                              },
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
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )),
                            Flexible(
                              child: Row(
                                children: [
                                  const Icon(
                                    CustomIcons.star,
                                    color: AppColors.STAR_COLOR,
                                    size: 16,
                                  ),
                                  Text(
                                    product.rate.toString(),
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.kDefaultPadding * 2),
                child: Column(
                  children: [
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
                                        color: AppColors.BUY_NOW_COLOR,
                                        fontFamily: 'OpenSans'),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
