import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pachalik_flutter/screens/blocks_list.dart';
import 'package:pachalik_flutter/screens/canvas.dart';
import 'package:pachalik_flutter/providers/canvas_provider.dart';
import 'package:pachalik_flutter/models/block_model.dart';
import 'package:pachalik_flutter/screens/documents_list.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canvasBlocks = ref.watch(canvasBlocksProvider);

    void addBlockToCanvas(Block block) {
      ref.read(canvasBlocksProvider.notifier).addBlock(block);
    }

    void onReorder(int oldIndex, int newIndex) {
      ref.read(canvasBlocksProvider.notifier).reorderBlocks(oldIndex, newIndex);
    }

    void onDelete(int index) {
      ref.read(canvasBlocksProvider.notifier).deleteBlock(index);
    }

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Top full-width box (unchanged)
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[900],
                  border: Border.all(color: Colors.orange[300]!, width: 2),
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      Center(
                        child: Text(
                          'Pachalik Ouedlaou',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[300],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            SizedBox(width: 20),
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  Colors.orange[300],
                                ),
                                foregroundColor: WidgetStatePropertyAll(
                                  Colors.black,
                                ),
                              ),
                              child: Text("New Document"),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  Colors.orange[300],
                                ),
                                foregroundColor: WidgetStatePropertyAll(
                                  Colors.black,
                                ),
                              ),
                              child: Text("File"),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  Colors.orange[300],
                                ),
                                foregroundColor: WidgetStatePropertyAll(
                                  Colors.black,
                                ),
                              ),
                              child: Text("Edit"),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  Colors.orange[300],
                                ),
                                foregroundColor: WidgetStatePropertyAll(
                                  Colors.black,
                                ),
                              ),
                              child: Text("Print"),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  Colors.orange[300],
                                ),
                                foregroundColor: WidgetStatePropertyAll(
                                  Colors.black,
                                ),
                              ),
                              child: Text("Save to cloud"),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              // Bottom two boxes - responsive
              LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[900],
                            border: Border.all(
                              color: Colors.orange[300]!,
                              width: 2,
                            ),
                          ),
                          child: DocumentCanvas(
                            blocks: canvasBlocks,
                            onReorder: onReorder,
                            onDelete: onDelete,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[900],
                            border: Border.all(
                              color: Colors.orange[300]!,
                              width: 2,
                            ),
                          ),
                          child: DefaultTabController(
                            length: 2,
                            child: Column(
                              children: [
                                TabBar(
                                  tabs: [
                                    Tab(text: 'Blocks'),
                                    Tab(text: 'Documents'),
                                  ],
                                  labelColor: Colors.orange[300],
                                  unselectedLabelColor: Colors.grey,
                                  indicatorColor: Colors.orange[300],
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      BlocksList(onAddToCanvas: addBlockToCanvas),
                                      DocumentsList(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
