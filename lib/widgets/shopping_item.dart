import 'package:flutter/material.dart';

class ShoppingItem extends StatelessWidget {
  final String text;
  const ShoppingItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      elevation: 2, // subtle shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(text),
        dense: true,          // keeps the card nice and compact
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}