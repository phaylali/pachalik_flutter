import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlockEditDialog extends StatefulWidget {
  final String initialTitle;
  final String initialPreview;
  final Function(String, String) onSave;

  const BlockEditDialog({
    super.key,
    required this.initialTitle,
    required this.initialPreview,
    required this.onSave,
  });

  @override
  State<BlockEditDialog> createState() => _BlockEditDialogState();
}

class _BlockEditDialogState extends State<BlockEditDialog> {
  late TextEditingController titleController;
  late TextEditingController previewController;
  String selectedFont = 'Tajawal';

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.initialTitle);
    previewController = TextEditingController(text: widget.initialPreview);
  }

  @override
  void dispose() {
    titleController.dispose();
    previewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 400,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[900],
          border: Border.all(color: Colors.orange[300]!, width: 2),
        ),
        child: Column(
          children: [
            // Toolbar row 1
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // Fonts dropdown
                  DropdownButton<String>(
                    value: selectedFont,
                    dropdownColor: Colors.grey[800],
                    style: TextStyle(color: Colors.white),
                    items: ['Tajawal', 'Arial', 'Times New Roman', 'Courier New', 'Verdana']
                        .map((font) => DropdownMenuItem(
                              value: font,
                              child: Text(font),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedFont = value!;
                      });
                    },
                  ),
                  const SizedBox(width: 16),
                  // Formatting icons
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.format_bold, color: Colors.orange[300]),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.format_italic, color: Colors.orange[300]),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.format_underlined, color: Colors.orange[300]),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.format_list_bulleted, color: Colors.orange[300]),
                  ),
                ],
              ),
            ),
            // Toolbar row 2
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.format_align_left, color: Colors.orange[300]),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.format_align_center, color: Colors.orange[300]),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.format_align_right, color: Colors.orange[300]),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.link, color: Colors.orange[300]),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.image, color: Colors.orange[300]),
                  ),
                ],
              ),
            ),
            // Text editing area
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: titleController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Title',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange[300]!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange[300]!),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: TextField(
                        controller: previewController,
                        maxLines: null,
                        expands: true,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Content',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange[300]!),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange[300]!),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Buttons
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Cancel', style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      widget.onSave(titleController.text, previewController.text);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[300],
                      foregroundColor: Colors.black,
                    ),
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}