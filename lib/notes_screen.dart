import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'note_provider.dart'; // Sesuaikan dengan nama file Anda

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  void _addNote() {
    String title = _titleController.text;
    String content = _contentController.text;

    if (title.isNotEmpty && content.isNotEmpty) {
      Note note = Note(title: title, content: content);
      Provider.of<NoteProvider>(context, listen: false).addNote(note);
      _titleController.clear();
      _contentController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Note> notes = Provider.of<NoteProvider>(context).notes;

    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notes[index].title),
                  subtitle: Text(notes[index].content),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'Enter note title...',
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _contentController,
                  decoration: InputDecoration(
                    hintText: 'Enter note content...',
                  ),
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: _addNote,
                  child: Text('Add Note'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
