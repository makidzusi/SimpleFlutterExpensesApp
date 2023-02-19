import 'package:flutter/material.dart';

class DismissibleBg extends StatelessWidget {
  const DismissibleBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: Colors.red[500], borderRadius: BorderRadius.circular(10)),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}
