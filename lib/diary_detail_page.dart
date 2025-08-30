import 'package:flutter/material.dart';

class DiaryDetailPage extends StatelessWidget {
  final Map<String, dynamic> note;
  final VoidCallback onDelete;
  final VoidCallback onPin;

  const DiaryDetailPage({
    super.key,
    required this.note,
    required this.onDelete,
    required this.onPin,
  });

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(note['date']);
    final wordCount = note['content'].trim().isEmpty
        ? 0
        : note['content'].trim().split(RegExp(r'\s+')).length;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          note['title'],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: onPin,
            icon: Icon(
              note['pinned'] ? Icons.push_pin : Icons.push_pin_outlined,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // DATE + WORD COUNT
              Text(
                "${date.month}/${date.day}/${date.year}   •   $wordCount words",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 16),

              // NOTE CONTENT
              Text(
                note['content'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
