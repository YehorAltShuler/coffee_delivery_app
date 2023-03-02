import 'package:coffee_delivery_app/resources/values/app_colors.dart';
import 'package:coffee_delivery_app/resources/values/app_constants.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector(
      {super.key,
      required this.categories,
      this.borderRadius,
      this.selectedTextStyle,
      this.unSelectedTextStyle});

  final List<String> categories;

  final BorderRadius? borderRadius;
  final TextStyle? selectedTextStyle;
  final TextStyle? unSelectedTextStyle;

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var children = List.generate(
      widget.categories.length,
      (index) => Material(
        borderRadius: widget.borderRadius,
        child: InkWell(
          borderRadius: widget.borderRadius,
          onTap: () {
            setState(() {
              _selectedIndex =
                  widget.categories.indexOf(widget.categories[index]);
            });
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.SECONDARY_COLOR),
                color: _selectedIndex ==
                        widget.categories.indexOf(widget.categories[index])
                    ? AppColors.SECONDARY_COLOR
                    : AppColors.PRIMARY_COLOR,
                borderRadius: widget.borderRadius),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.kDefaultPadding),
                child: Text(
                  widget.categories[index],
                  style: _selectedIndex ==
                          widget.categories.indexOf(widget.categories[index])
                      ? (widget.selectedTextStyle ??
                          Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: AppColors.PRIMARY_COLOR))
                      : (widget.unSelectedTextStyle ??
                          Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: AppColors.SECONDARY_COLOR)),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    return Wrap(
      spacing: AppConstants.kDefaultPadding,
      runSpacing: AppConstants.kDefaultPadding / 2,
      children: [...children],
    );
  }
}
