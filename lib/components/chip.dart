import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({Key? key, required this.label, required this.color}) : super(key: key);

  final String label;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return  Chip(
      labelPadding: const EdgeInsets.all(2.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.white70,
        child: Text(label[0].toUpperCase()),
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: const EdgeInsets.all(8.0),
    );
  }
}
