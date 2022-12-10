import 'package:flutter/material.dart';
import 'package:project_ym/constants/strings.dart';

class ErrorView extends StatelessWidget {
  final Object error;

  const ErrorView({Key? key,  required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 60),
            const Text(Strings.error),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                error.toString(),
                textAlign: TextAlign.center,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
