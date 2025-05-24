import 'package:ahiaa/features/shop/category/domain/entities/category.dart';
import 'package:ahiaa/features/shop/category/services/category_services.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/dependencies/init_dependencies.dart';
import '../../../../product/business_logic/cubits/sub_categories.dart';

class SubcatCheckbox extends StatefulWidget {
  const SubcatCheckbox({super.key, required this.subCategory});
  final Category subCategory;

  @override
  State<SubcatCheckbox> createState() => _SubcatCheckboxState();
}

class _SubcatCheckboxState extends State<SubcatCheckbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: serviceLocator<ProductSubCategoryCubit>().state.contains(
        widget.subCategory.id.toString(),
      ),
      onChanged: (value) {
        setState(() {
          value = !value!;
        });
        if (value != true) {
          if (widget.subCategory.parentId !=
              serviceLocator<SubCategoryCheckboxCubit>().state.toString()) {
            serviceLocator<ProductSubCategoryCubit>().emptyCubit();
            serviceLocator<ProductSubCategoryCubit>().addSubcategoryId(
              widget.subCategory.id.toString(),
            );
          }
          serviceLocator<ProductSubCategoryCubit>().addSubcategoryId(
            widget.subCategory.id.toString(),
          );
          serviceLocator<SubCategoryCheckboxCubit>().addParentId(
            int.parse(widget.subCategory.parentId.toString()),
          );
        } else {
          serviceLocator<ProductSubCategoryCubit>().removeSubcategoryId(
            widget.subCategory.id.toString(),
          );
        }
      },
    );
  }
}
