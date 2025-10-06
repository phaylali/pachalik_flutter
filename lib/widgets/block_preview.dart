import 'package:flutter/material.dart';

class BlockPreview extends StatelessWidget {
  final String title;
  final String preview;

  const BlockPreview({super.key, required this.title, required this.preview});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[900],
          border: Border.all(color: Colors.orange[300]!, width: 2),
        ),
        child: Column(
          children: [
            // Top section - 20% of height, split into title (left) and actions (right)
            // Top section - 20% of height, split into title (left) and actions (right)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1 * 0.20,
              child: Row(
                children: [
                  // Title centered in the left half
                  Expanded(
                    child: Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Actions centered in the right half
                  Expanded(
                    child: Center(
                      child: Icon(
                        Icons.delete_forever,
                        color: Colors.red[300],
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Preview section - remaining height, centered
            Expanded(
              child: Center(
                child: Text(
                  preview,
                  style: TextStyle(color: Colors.orange[300], fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
