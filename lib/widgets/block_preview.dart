import 'package:flutter/material.dart';

class BlockPreview extends StatelessWidget {
  final String title;
  final String preview;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onDelete;

  const BlockPreview({
    super.key,
    required this.title,
    required this.preview,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final container = Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[900],
        border: Border.all(color: Colors.orange[300]!, width: 2),
      ),
      child: Column(
        children: [
          // Top section - 20% of height, split into title (left) and actions (right)
          SizedBox(
            height: 16,
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
                    child: IconButton(
                      onPressed: onDelete,
                      padding: EdgeInsets.all(12),
                      icon: Icon(
                        Icons.delete_forever,
                        color: Colors.red[300],
                        size: 28,
                      ),
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
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: (onTap != null || onLongPress != null || onDoubleTap != null) ? GestureDetector(onTap: onTap, onLongPress: onLongPress, onDoubleTap: onDoubleTap, child: container) : container,
    );
  }
}
