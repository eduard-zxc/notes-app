import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_page_assignment/models/note.dart';
import 'package:notes_page_assignment/storage/storage_service.dart';
import 'package:notes_page_assignment/themes/theme.dart';
import 'package:notes_page_assignment/utils/add_note.dart';
import 'package:notes_page_assignment/utils/add_note_android.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final String? title;
  final String? description;
  const Home({super.key, this.title, this.description});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final noteList = [
    NoteEntity(title: 'Title', description: 'description'),
    NoteEntity(title: 'Sports', description: 'Golf'),
    NoteEntity(title: 'ToDo', description: 'hunt mammoth')
  ];

  void deleteNote(NoteEntity note) {
    noteList.remove(note);
    setState(() {});
  }

  void addNote(String title, String description) {
    noteList.add(
      NoteEntity(title: title, description: description),
    );
    setState(() {});
  }

  void editNote(int index, String title, String description) {
    noteList[index] = NoteEntity(title: title, description: description);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool isIos = Theme.of(context).platform == TargetPlatform.iOS;
    final provider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                final themeMode = provider.themeMode;
                provider.setThemeMode(themeMode == ThemeMode.dark
                    ? ThemeMode.light
                    : ThemeMode.dark);
              });
            },
            icon: const RightIconWidget(),
          ),
        ],
        leading: IconButton(
          onPressed: () => context.go('/cat'),
          icon: const Icon(Icons.catching_pokemon_outlined),
        ),
      ),
      body: ListView.builder(
        itemCount: noteList.length,
        itemBuilder: (context, index) => Note(
          note: noteList[index],
          delete: (note) => deleteNote(note),
          edit: (note, title, description) {
            editNote(index, title, description);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return isIos
                  ? AddNote(add: addNote)
                  : AddNoteAndroid(add: addNote);
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
