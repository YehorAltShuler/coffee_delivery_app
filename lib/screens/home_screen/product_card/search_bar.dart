import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import '../../../providers/products_provider.dart';
import '../../../resources/values/app_colors.dart';
import '../../../resources/values/app_constants.dart';
import '../../../resources/values/custom_icons.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;

    void runFilter(String enteredKeyword) {
      List<Product> results = [];
      if (enteredKeyword.isEmpty) {
        results = products;
        Provider.of<Products>(context, listen: false)
            .filterProductList(results);
      } else {
        results = products
            .where((product) => product.title
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
        Provider.of<Products>(context, listen: false)
            .filterProductList(results);
      }
    }

    return Container(
      decoration: const BoxDecoration(
          color: AppColors.PRIMARY_COLOR,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.kDefaultPadding,
            vertical: AppConstants.kDefaultPadding * 2),
        child: TextField(
          cursorColor: AppColors.SECONDARY_COLOR,
          onChanged: (value) => runFilter(value),
          decoration: InputDecoration(
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.SEARCH_BAR_COLOR),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(color: AppColors.SECONDARY_COLOR_50_OPACITY),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.SEARCH_BAR_COLOR),
            ),
            filled: true,
            fillColor: AppColors.SEARCH_BAR_COLOR,
            hintText: 'Browse your favourite coffee...',
            hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColors.SECONDARY_COLOR_50_OPACITY,
                ),
            // prefixIconColor: MaterialStateColor.resolveWith((states) {
            //   if (states.contains(MaterialState.focused)) {
            //     return AppColors.SECONDARY_COLOR;
            //   }
            //   return AppColors.SECONDARY_COLOR_50_OPACITY;
            // }),
            prefixIcon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(
                CustomIcons.search,
                color: AppColors.SECONDARY_COLOR_50_OPACITY,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
