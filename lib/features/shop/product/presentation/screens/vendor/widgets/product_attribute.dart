import 'package:flutter/material.dart';

import '../../../../../../../core/common/widgets/containers/rounded_container.dart';
import '../../../../../../../core/common/widgets/fields/custom_textfield.dart';
import '../../../../../../../core/dependencies/init_dependencies.dart'
    show serviceLocator;
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/validators/validation.dart';
import '../../../../business_logic/cubits/attribute_cubits.dart';

class AttributeSelect extends StatelessWidget {
  const AttributeSelect({
    super.key,
    required this.controller,
    required this.controller2,

    required this.hintText,
    required this.hintText2,
    required this.formHeader,
    required this.fieldName,
    this.isColorField = false,
    this.colorWidget,
  });

  final TextEditingController controller, controller2;
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
          children: [
            AttributeFormField(
              controller: controller,
              hintext: hintText,
              fieldName: fieldName,
            ),
            if (!isColorField)
              AttributeFormField(
                controller: controller2,
                hintext: hintText2,
                fieldName: fieldName,
                flex: 2,
              ),
            if (isColorField) colorWidget!,
            GestureDetector(
              onTap: () {
                serviceLocator<ProductAttributeCubits>().addProductAttribute(
                  controller.text,
                  [controller2.text],
                );
                controller2.clear();
              },
              child: TRoundedContainer(
                // height: 20,
                // width: 50,
                padding: EdgeInsets.symmetric(
                  vertical: PSizes.xs,
                  horizontal: PSizes.sm,
                ),
                backgroundColor: PColors.secondary,
                child: Center(
                  child: Text(
                    'Apply',
                    style: Theme.of(context).textTheme.titleSmall!.apply(
                      color: PColors.light,
                      fontWeightDelta: 2,
                    ),
                  ),
                ),
              ),
            ),
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
    this.flex = 1,
  });

  final TextEditingController controller;
  final String hintext, fieldName;
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
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
        fieldName: fieldName,
        validator: (value) => PValidator.validateEmptyText(fieldName, value),
      ),
    );
  }
}
