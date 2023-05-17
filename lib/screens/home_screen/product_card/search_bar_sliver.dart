import 'package:coffee_delivery_app/screens/home_screen/product_card/search_bar.dart';
import 'package:flutter/material.dart';

class SearchBarSliver extends SliverPersistentHeaderDelegate {
  SearchBarSliver({
    required this.minExtent,
    required this.maxExtent,
  });

  @override
  final double minExtent;
  @override
  final double maxExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const SearchBar();
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
