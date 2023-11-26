import 'package:flutter/material.dart';

class Note {
  String title;
  String content;

  Note({required this.title, required this.content});
}

class NoteProvider with ChangeNotifier {
  List<Note> _notes = [];
  List<Note> _recycleBin = [];

  List<Note> get notes => _notes;
  List<Note> get recycleBin => _recycleBin;

  void addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  void deleteNotes(List<Note> notesToDelete) {
    _notes.removeWhere((note) => notesToDelete.contains(note));
    _recycleBin.addAll(notesToDelete);
    notifyListeners();
  }
}
