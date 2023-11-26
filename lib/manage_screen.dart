import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'note_provider.dart';

class ManageScreen extends StatefulWidget {
  @override
  _ManageScreenState createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  List<Note> selectedNotes = [];

  void _toggleSelection(Note note) {
    setState(() {
      if (selectedNotes.contains(note)) {
        selectedNotes.remove(note);
      } else {
        selectedNotes.add(note);
      }
    });
  }

  void _deleteSelectedNotes() {
    Provider.of<NoteProvider>(context, listen: false)
        .deleteNotes(selectedNotes);
    setState(() {
      selectedNotes.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Note> notes = Provider.of<NoteProvider>(context).notes;

    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Notes'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (selectedNotes.isNotEmpty) ? _deleteSelectedNotes : null,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Total Notes: ${notes.length}'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return ListTile(
                  title: Text(note.title),
                  subtitle: Text(note.content),
                  onTap: () => _toggleSelection(note),
                  tileColor: selectedNotes.contains(note)
                      ? Colors.blue.withOpacity(0.3)
                      : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
