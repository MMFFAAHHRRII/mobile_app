import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_notepad/note_provider.dart' as note_provider;
import 'package:app_notepad/recycle_bin_screen.dart' as recycle_bin_screen;
import 'home_screen.dart';
import 'notes_screen.dart';
import 'manage_screen.dart';
import 'about_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => note_provider.NoteProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notepad App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyBottomNavigationBar(),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    NotesScreen(),
    ManageScreen(),
    recycle_bin_screen.RecycleBinScreen(),
    AboutScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'Manage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restore_from_trash),
            label: 'Recycle Bin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
    );
  }
}
