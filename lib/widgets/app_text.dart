import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppText extends StatelessWidget {
  final String label;
  final String hint;
  final bool password;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final FocusNode nextFocus;

  AppText(
    this.label,
    this.hint, {
    this.password = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocus,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 255,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) FocusScope.of(context).requestFocus(nextFocus);
      },
      style: TextStyle(
        fontSize: 25,
      ),
      obscureText: password,
      inputFormatters: [
        BlacklistingTextInputFormatter(RegExp("[ ]"))
      ],
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 25,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 16,
        ),
      ),
      autocorrect: false,
    );
  }
}
