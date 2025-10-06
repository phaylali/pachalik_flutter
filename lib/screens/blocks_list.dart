import 'package:flutter/material.dart';
import 'package:pachalik_flutter/widgets/block_preview.dart';
import 'package:pachalik_flutter/models/block_model.dart';

class BlocksList extends StatelessWidget {
  const BlocksList({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of blocks - replace with your data source
    final List<Block> blocksList = [
      Block(title: 'Block 1 Title', preview: 'This is preview 1'),
      Block(title: 'Block 2 Title', preview: 'This is preview 2'),
      Block(title: 'Block 3 Title', preview: 'This is preview 3'),
      Block(title: 'Block 1 Title', preview: 'This is preview 1'),
      Block(title: 'Block 2 Title', preview: 'This is preview 2'),
      Block(title: 'Block 3 Title', preview: 'This is preview 3'),
      Block(title: 'Block 1 Title', preview: 'This is preview 1'),
      Block(title: 'Block 2 Title', preview: 'This is preview 2'),
      Block(title: 'Block 3 Title', preview: 'This is preview 3'),
      Block(title: 'Block 1 Title', preview: 'This is preview 1'),
      Block(title: 'Block 2 Title', preview: 'This is preview 2'),
      Block(title: 'Block 3 Title', preview: 'This is preview 3'),
    ];

    return Column(
      children: [
        SizedBox(height: 5),
        Center(
          child: Text(
            'Blocks List',
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
          child: ListView.builder(
            itemCount: blocksList.length,
            itemBuilder: (context, index) {
              final block = blocksList[index];
              return BlockPreview(
                title: block.title,
                preview: block.preview,
              );
            },
          ),
        ),
      ],
    );
  }
}
