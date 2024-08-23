import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_page_assignment/models/note.dart';
import 'package:notes_page_assignment/utils/add_note.dart';

class Home extends StatefulWidget {
  final String? title;
  final String? description;
  const Home({super.key, this.title, this.description});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var target = TargetPlatform.iOS;

  final List<Note> noteList = [
    const Note(title: 'Title', description: 'description'),
    const Note(title: 'Sports', description: 'Golf'),
    const Note(title: 'ToDo', description: 'hunt mammoth')
  ];

  void deleteNote(Note index) {
    setState(() {
      noteList.remove(index);
    });
  }

  void addNote() {
    setState(() {
      noteList.add(
        Note(title: widget.title, description: widget.description),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: ListView.builder(
        itemCount: noteList.length,
        itemBuilder: (context, index) => Note(
          title: noteList[index].title,
          description: noteList[index].description,
          noteList: noteList,
          delete: () => setState(() {
            deleteNote(noteList[index]);
          }),
          index: index,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddNote(noteList: noteList);
            },
          );
        },
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.add),
      ),
    );
  }
}
