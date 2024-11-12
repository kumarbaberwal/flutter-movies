import 'package:flutter/material.dart';

class CategoryText extends StatelessWidget {
  final String category;
  const CategoryText({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
        left: 16,
      ),
      child: Text(
        category,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}
