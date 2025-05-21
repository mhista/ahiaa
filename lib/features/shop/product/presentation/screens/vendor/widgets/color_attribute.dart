import 'package:ahiaa/core/dependency/init_dependencies.dart';
import 'package:ahiaa/features/shop/product/business_logic/cubits/color_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/common/widgets/containers/rounded_container.dart';
import '../../../../../../../core/common/widgets/fields/custom_textfield.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';

class ColorAttribute extends StatelessWidget {
  const ColorAttribute({
    super.key,
    required this.controller,
    required this.hintText,
    required this.hintText2,
    required this.formHeader,
    required this.fieldName,
    this.isColorField = false,
    this.colorWidget,
  });

  final TextEditingController controller;
  final String hintText, hintText2, formHeader, fieldName;
  final bool isColorField;
  final Widget? colorWidget;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: PSizes.spaceBtwItems / 4,

      children: [
        Text(formHeader, style: Theme.of(context).textTheme.headlineSmall),
        Row(
          spacing: PSizes.md,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            BlocBuilder<ColorPickerCubit, List<Color?>>(
              builder: (context, state) {
                if (state.isEmpty) {
                  return SizedBox.shrink();
                } else {
                  return Wrap(
                    spacing: PSizes.spaceBtwItems / 4,
                    runSpacing: PSizes.spaceBtwItems / 4,

                    children:
                        serviceLocator<ColorPickerCubit>().state
                            .map(
                              (el) => TRoundedContainer(
                                width: 30,
                                height: 30,
                                backgroundColor: el,
                              ),
                            )
                            .toList(),
                  );
                }
              },
            ),
            colorWidget ?? SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}

class AttributeFormField extends StatelessWidget {
  const AttributeFormField({
    super.key,
    required this.controller,
    required this.hintext,
    required this.fieldName,
  });

  final TextEditingController controller;
  final String hintext, fieldName;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFieldForm(
        canDispose: false,
        decoration: InputDecoration(
          hintText: hintext,
          hintStyle: Theme.of(context).textTheme.titleMedium!.apply(
            fontWeightDelta: -1,
            color: PColors.accent.withValues(alpha: 0.9),
          ),

          border: UnderlineInputBorder(
            borderSide: BorderSide(color: PColors.dark),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: PColors.dark),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: PColors.dark),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: PColors.warning),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: PColors.warning),
          ),
        ),
        controller: controller,
        fieldName: 'Size',
      ),
    );
  }
}
