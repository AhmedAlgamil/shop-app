import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField({
    Key? key,
    required this.controller,
    required this.label,
    required this.validationText,
    // required this.prefixIcon,
    this.onTap,
    this.obscureText=false,
    this.readOnly=false,
    this.textInputType,
    this.suffixIcon,
    this.prefixIcon,

  }) : super(key: key);

  String label;
  // IconData prefixIcon;
  String validationText;
  void Function()? onTap;
  bool obscureText ;
  bool readOnly;
  TextInputType? textInputType;
  TextEditingController controller;
  Widget? suffixIcon;
  Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: prefixIcon,
        border:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        label: Row(
          children: [
            Text(label),
          ],
        ),
        // prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,
      ),
      onTap: onTap,
      validator: (String? value) {
        if (value!.isEmpty) {
          return validationText;
        }
      },
      obscureText: obscureText,
      keyboardType: textInputType,
      readOnly: readOnly,
      controller: controller,
    );
  }
}
