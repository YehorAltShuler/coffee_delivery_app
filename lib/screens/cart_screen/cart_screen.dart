import 'package:coffee_delivery_app/resources/values/app_constants.dart';
import 'package:coffee_delivery_app/screens/cart_screen/cart_items_grid.dart';

import 'package:coffee_delivery_app/widgets/dashed_line_painter.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_items_provider.dart';
import '../../resources/values/app_colors.dart';
import '../../widgets/coupon.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartItemsProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverAppBar(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              centerTitle: true,
              title: Text('Cart'),
            ),
            const CartItemsList(),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  children: [
                    CustomPaint(
                      painter: DashedLinePainter(),
                      size: const Size.fromHeight(0),
                    ),
                    const SizedBox(height: 20),
                    const Coupon(),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Charges',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          '\$Mock Data',
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Taxes',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          '\$Mock Data',
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomPaint(
                      painter: DashedLinePainter(),
                      size: const Size.fromHeight(0),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Grand Total',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          '\$${cartItems.totalPrice.toStringAsFixed(2)}',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontFamily: 'Open Sans'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppConstants.k12Padding),
                          child: Text(
                            'PAY NOW',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: AppColors.BUY_NOW_COLOR,
                                    fontFamily: 'OpenSans'),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
