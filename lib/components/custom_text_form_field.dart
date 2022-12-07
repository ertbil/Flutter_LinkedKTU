// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:project_ym/services/string_extention.dart';
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
  double? padding;




  CustomTextFormField(
      {
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
    this.padding = 8.0,



  }
  ) : super(key: key);

  String? mailValidator(TextEditingController? controller) {

    if (controller!.text.isEmpty) {
      return 'Please enter your email';
    } else if (!controller.text.trim().isValidEmail()) {
      return 'Please enter a valid email address';
    }
    // else if () {
    //   return ;
    // }
    return null;

    }




  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(widget.padding??8.0),
      child: TextFormField(
        obscureText: widget.isHidden && widget.isPassword,
        validator: widget.isEmail  && widget.controller != null ?
            (value) =>widget.mailValidator(widget.controller): null,
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
      ),
    );
  }
}
