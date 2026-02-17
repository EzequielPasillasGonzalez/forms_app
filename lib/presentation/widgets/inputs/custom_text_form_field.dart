import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscuredText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    this.obscuredText = false,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(40));

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscuredText,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colors.primary),
        ),
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red.shade800),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red.shade800),
        ),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,

        focusColor: colors.secondary,
        errorText: errorMessage,
      ),
    );
  }
}
