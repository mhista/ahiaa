import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class TextFieldForm extends StatefulWidget {
  const TextFieldForm({
    super.key,
    required this.controller,
    required this.fieldName,
    this.validator,
    this.labelText,
    this.hintText,

    this.icon,
    this.obscureText = false,
    this.expands = false,
    this.suffixIcon,
    this.useSuffixIcon = false,
    this.minLines,
    this.decoration,
  });
  final TextEditingController controller;
  final String fieldName;
  final String? Function(String?)? validator;
  final String? labelText, hintText;
  final IconData? icon;
  final IconData? suffixIcon;
  final int? minLines;
  final bool obscureText;
  final bool expands, useSuffixIcon;
  final InputDecoration? decoration;

  @override
  State<TextFieldForm> createState() => _TextFieldFormState();
}

class _TextFieldFormState extends State<TextFieldForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      controller: widget.controller,
      validator: widget.validator,
      expands: widget.expands,
      minLines: widget.minLines,
      maxLines: null,
      decoration:
          widget.decoration ??
          InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.titleMedium!.apply(
              fontWeightDelta: -1,
              color: PColors.accent.withValues(alpha: 0.9),
            ),
            prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
            suffixIcon:
                widget.useSuffixIcon
                    ? IconButton(
                      onPressed: () {},
                      icon: Icon(widget.suffixIcon),
                    )
                    : null,
          ),
    );
  }

  @override
  void dispose() {
    debugPrint('disposing ${widget.controller.text}');
    widget.controller.dispose();
    super.dispose();
  }
}
