import 'package:flutter/material.dart';

import '../constants/strings.dart';

class LogoAndName extends StatelessWidget {
  const LogoAndName({Key? key, this.textColor= Colors.black, this.mainAxisAlignment = MainAxisAlignment.start}) : super(key: key);

  final Color? textColor;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.width * 0.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(Strings.logoPath),
            )),
        Text(
          Strings.appName,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: textColor ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
