import 'package:flutter/material.dart';

class RouterElevatedButton extends StatelessWidget {
  final String? text;
  final bool pushReplacement;
  final Widget page;
  final IconData? icon;


  const RouterElevatedButton({
    Key? key,
    this.text,
    this.pushReplacement = false,
    required this.page,
    this.icon,
  }) : super(key: key);

  pushReplacementRoute(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
  pushRoute(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        pushReplacement ? pushReplacementRoute(context) : pushRoute(context);
      },
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon),
          if (text != null) Text(text!),
        ],
      ),
    );
  }
}
