// recycle_bin_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'note_provider.dart'; // Impor definisi Note dan NoteProvider dari note_provider.dart

class RecycleBinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Note> recycleBin = Provider.of<NoteProvider>(context).recycleBin;

    return Scaffold(
      appBar: AppBar(
        title: Text('Recycle Bin'),
      ),
      body: ListView.builder(
        itemCount: recycleBin.length,
        itemBuilder: (context, index) {
          final note = recycleBin[index];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.content),
          );
        },
      ),
    );
  }
}
