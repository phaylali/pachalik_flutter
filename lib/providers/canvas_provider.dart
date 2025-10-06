import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pachalik_flutter/models/block_model.dart';

class CanvasBlocksNotifier extends Notifier<List<Block>> {
  @override
  List<Block> build() {
    return const [
      Block(title: 'Existing Block 1', preview: 'existing preview 1'),
      Block(title: 'Existing Block 2', preview: 'existing preview 2'),
    ];
  }

  void addBlock(Block block) {
    state = [...state, block];
  }

  void reorderBlocks(int oldIndex, int newIndex) {
    final newState = List<Block>.from(state);
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = newState.removeAt(oldIndex);
    newState.insert(newIndex, item);
    state = newState;
  }

  void deleteBlock(int index) {
    state = List<Block>.from(state)..removeAt(index);
  }

  void updateBlock(int index, Block block) {
    state = List<Block>.from(state)..[index] = block;
  }
}

final canvasBlocksProvider = NotifierProvider<CanvasBlocksNotifier, List<Block>>(
  () => CanvasBlocksNotifier(),
);
