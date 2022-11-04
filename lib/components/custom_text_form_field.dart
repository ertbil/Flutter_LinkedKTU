// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../constants/strings.dart';

class CustomTextFormField extends StatefulWidget {
  String hintText;
  String? labelText;
  String? errorText;
  bool isPassword;
  bool isEmail;
  bool isPhone;
  bool isNumber;
  TextEditingController? controller;
  Icon prefixIcon;
  Icon? suffixIcon;
  bool isHidden;

  CustomTextFormField({
    Key? key,
    required this.hintText,
    this.labelText,
    this.errorText = Strings.defaultErrorMessage,
    this.isPassword = false,
    this.isEmail = false,
    this.isPhone = false,
    this.isNumber = false,
    this.controller,
    required this.prefixIcon,
    this.suffixIcon,
    this.isHidden = true,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        //TODO add validation
        return null;
      },
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
        labelText: widget.hintText,
        floatingLabelStyle: const TextStyle(
          height: 4,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.isHidden = !widget.isHidden;
                  });
                },
                icon: widget.isHidden
                    ? const Icon(Icons.remove_red_eye_rounded)
                    : const Icon(Icons.remove_red_eye_outlined))
            : null,
      ),
    );
  }
}
