import 'package:flutter/material.dart';

class TextFieldForm extends StatefulWidget {
  const TextFieldForm({
    super.key,
    required this.controller,
    required this.fieldName,
    this.validator,
    required this.labelText,
    required this.icon,
    this.obscureText = false,
    this.expands = false,
    this.suffixIcon,
    this.useSuffixIcon = false,
  });
  final TextEditingController controller;
  final String fieldName;
  final String? Function(String?)? validator;
  final String labelText;
  final IconData icon;
  final IconData? suffixIcon;

  final bool obscureText;
  final bool expands, useSuffixIcon;

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
        decoration: InputDecoration(
          labelText: widget.labelText,
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.useSuffixIcon
              ? IconButton(onPressed: () {}, icon: Icon(widget.suffixIcon))
              : null,
        ));
  }

  @override
  void dispose() {
    debugPrint('disposing ${widget.controller.text}');
    widget.controller.dispose();
    super.dispose();
  }
}
