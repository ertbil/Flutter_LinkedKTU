import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final error;

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
            const Text('Error'),
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
