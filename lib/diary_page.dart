import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'diary_detail_page.dart';

class DiaryPage extends StatefulWidget {
  static const String id = 'DiaryPage';

  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  List<Map<String, dynamic>> notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  // Load saved notes from local storage
  Future<void> _loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedNotes = prefs.getString('diary_notes');
    if (savedNotes != null) {
      setState(() {
        notes = List<Map<String, dynamic>>.from(json.decode(savedNotes));
      });
    }
  }

  // Save notes locally
  Future<void> _saveNotes() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('diary_notes', json.encode(notes));
  }

  // Add a new note
  void _addNote() async {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("New Note", style: TextStyle(fontWeight: FontWeight.bold)),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: "Title"),
                ),
                TextField(
                  controller: contentController,
                  decoration: const InputDecoration(labelText: "Content"),
                  maxLines: 5,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty || contentController.text.isNotEmpty) {
                  setState(() {
                    notes.insert(0, {
                      'title': titleController.text,
                      'content': contentController.text,
                      'date': DateTime.now().toIso8601String(),
                      'pinned': false,
                    });
                    _saveNotes();
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  // Toggle pin status
  void _togglePin(int index) {
    setState(() {
      notes[index]['pinned'] = !notes[index]['pinned'];
      notes.sort((a, b) => b['pinned'] ? 1 : -1); // Pinned notes go on top
      _saveNotes();
    });
  }

  // Delete a note
  void _deleteNoteAt(int index) {
    setState(() {
      notes.removeAt(index);
      _saveNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final pinnedNotes = notes.where((note) => note['pinned']).toList();
    final regularNotes = notes.where((note) => !note['pinned']).toList();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            if (pinnedNotes.isNotEmpty)
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0, left: 4),
                child: Text(
                  "Pinned",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ...pinnedNotes.map((note) => _buildNoteCard(note, pinnedNotes.indexOf(note))),
            const Divider(),
            ...regularNotes.map((note) => _buildNoteCard(note, notes.indexOf(note))),
          ],
        ),
      ),
    );
  }

  Widget _buildNoteCard(Map<String, dynamic> note, int index) {
    final date = DateTime.parse(note['date']);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DiaryDetailPage(
              note: note,
              onDelete: () => _deleteNoteAt(index),
              onPin: () => _togglePin(index),
            ),
          ),
        ).then((_) => _loadNotes());
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(0, 3))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note['title'],
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              "${date.month}/${date.day}/${date.year}",
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
