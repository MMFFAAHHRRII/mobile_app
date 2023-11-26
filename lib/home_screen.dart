import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'note_provider.dart'; // Sesuaikan dengan nama file Anda

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Note> notes = Provider.of<NoteProvider>(context).notes;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notes[index].title),
            subtitle: Text(notes[index].content),
          );
        },
      ),
    );
  }
}
