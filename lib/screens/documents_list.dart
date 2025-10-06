import 'package:flutter/material.dart';
import 'package:pachalik_flutter/widgets/document_preview.dart';
import 'package:pachalik_flutter/models/document_model.dart';

class DocumentsList extends StatelessWidget {
  const DocumentsList({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of documents - replace with your data source
    // Sample list of documents - replace with your data source
    final List<Document> documents = [
      Document(name: 'Project Proposal', type: 'docx'),
      Document(name: 'Meeting Notes', type: 'txt'),
      Document(name: 'README', type: 'md'),
      Document(name: 'Documentation', type: 'mdx'),
      Document(name: 'Code Comments', type: 'txt'),
      Document(name: 'User Guide', type: 'docx'),
      Document(name: 'Project Proposal', type: 'docx'),
      Document(name: 'Meeting Notes', type: 'txt'),
      Document(name: 'README', type: 'md'),
      Document(name: 'Documentation', type: 'mdx'),
      Document(name: 'Code Comments', type: 'txt'),
      Document(name: 'User Guide', type: 'docx'),
      Document(name: 'Project Proposal', type: 'docx'),
      Document(name: 'Meeting Notes', type: 'txt'),
      Document(name: 'README', type: 'md'),
      Document(name: 'Documentation', type: 'mdx'),
      Document(name: 'Code Comments', type: 'txt'),
      Document(name: 'User Guide', type: 'docx'),
    ];

    return Column(
      children: [
        SizedBox(height: 5),
        Center(
          child: Text(
            'Documents',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.orange[300],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 5),
        Expanded(
  child: GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,  // Keep at 2 columns for larger items
      crossAxisSpacing: 2,  // Increased spacing
      mainAxisSpacing: 2,   // Increased spacing
      childAspectRatio: 0.9, // Adjusted for taller items with name below
    ),
    itemCount: documents.length,
    itemBuilder: (context, index) {
      final document = documents[index];
      return DocumentPreview(
        name: document.name,
        type: document.type,
      );
    },
  ),
),

      ],
    );
  }
}

