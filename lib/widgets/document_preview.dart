import 'package:flutter/material.dart';

class DocumentPreview extends StatelessWidget {
  final String name;
  final String type;

  const DocumentPreview({
    super.key,
    required this.name,
    required this.type,
  });


IconData getIconForType(String type) {
  switch (type.toLowerCase()) {
    case 'docx':
      return Icons.description;  // Word document icon
    case 'txt':
      return Icons.text_fields;  // Text file icon
    case 'md':
    case 'mdx':
      return Icons.article;  // Markdown file icon
    default:
      return Icons.insert_drive_file;  // Generic file icon
  }
}


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12),
              
              border: Border.all(color: Colors.orange[300]!, width: 2),
            ),
            child: Center(
              child: Text(
                'Preview\nPlaceholder',
                style: TextStyle(
                  color: Colors.orange[300],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: 120,
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
