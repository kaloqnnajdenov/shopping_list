import 'package:flutter/material.dart';
import 'shopping_item.dart';

class DismissibleItem extends StatelessWidget {
  final String text;
  final VoidCallback onDismissed;
  const DismissibleItem({
    super.key,
    required this.text,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: key!,
      background: Container(),         // invisible filler (left side)
      secondaryBackground: Container(  // red “Delete” (right side)
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.delete, color: Colors.white),
            SizedBox(width: 8),
            Text('Delete', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      onDismissed: (_) => onDismissed(),
      child: ShoppingItem(text: text),
    );
  }
}