import 'package:flutter/material.dart';
import 'package:pachalik_flutter/widgets/block_preview.dart';
import 'package:pachalik_flutter/models/block_model.dart';

class DocumentCanvas extends StatefulWidget {
  const DocumentCanvas({super.key});

  @override
  State<DocumentCanvas> createState() => _DocumentCanvasState();
}

class _DocumentCanvasState extends State<DocumentCanvas> {
  late List<Block> blocksOnCanvas;

  @override
  void initState() {
    super.initState();
    // Initialize with sample data - replace with your data source
    blocksOnCanvas = [
      Block(title: 'Block 1', preview: 'preview 1'),
      Block(title: 'Block 2', preview: 'preview 2'),
      Block(title: 'Block 3', preview: 'preview 3'),
    ];
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final Block item = blocksOnCanvas.removeAt(oldIndex);
      blocksOnCanvas.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        Center(
          child: Text(
            'Canvas',
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
          child: ReorderableListView.builder(
            itemCount: blocksOnCanvas.length,
            itemBuilder: (context, index) {
              final block = blocksOnCanvas[index];
              return BlockPreview(
                key: ValueKey(block.title),  // Unique key for reordering
                title: block.title,
                preview: block.preview,
              );
            },
            onReorder: _onReorder,
          ),
        ),
      ],
    );
  }
}
