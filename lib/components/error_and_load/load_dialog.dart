
import 'package:flutter/material.dart';

class LoadDialog extends StatelessWidget {
  const LoadDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 100,
        width: 200,
        child: Card(
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(
                  width: 20,
                ),
                CircularProgressIndicator(),
                SizedBox(
                  width: 20,
                ),
                Text("Loading...",style: TextStyle(fontSize: 20),),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void hideDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}