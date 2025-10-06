import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pachalik_flutter/widgets/block_preview.dart';
import 'package:pachalik_flutter/models/block_model.dart';
import 'package:pachalik_flutter/providers/canvas_provider.dart';
import 'package:pachalik_flutter/widgets/block_edit_dialog.dart';

class DocumentCanvas extends ConsumerWidget {
  final List<Block> blocks;
  final Function(int, int) onReorder;
  final Function(int)? onDelete;

  const DocumentCanvas({
    super.key,
    required this.blocks,
    required this.onReorder,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DragTarget<Block>(
      onAcceptWithDetails: (block) {
        // This will be handled by the parent via addBlockToCanvas
        // The actual addition happens via Riverpod
      },
      builder: (context, candidateData, rejectedData) {
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
                itemCount: blocks.length,
                itemBuilder: (context, index) {
                  final block = blocks[index];
                  return BlockPreview(
                    key: ValueKey('${block.title}_$index'),  // Unique key
                    title: block.title,
                    preview: block.preview,
                    onTap: () {  },
                    onDoubleTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => BlockEditDialog(
                          initialTitle: block.title,
                          initialPreview: block.preview,
                          onSave: (title, preview) {
                            ref.read(canvasBlocksProvider.notifier).updateBlock(index, Block(title: title, preview: preview));
                          },
                        ),
                      );
                    },
                    onDelete: onDelete != null ? () => onDelete!(index) : null,
                  );
                },
                onReorder: onReorder,
              ),
            ),
          ],
        );
      },
    );
  }
}
