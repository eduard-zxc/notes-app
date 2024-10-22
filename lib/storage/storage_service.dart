import 'package:notes_page_assignment/models/note.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod/riverpod.dart';

class StorageService {
  static const _key = 'notes';

  Future<void> saveNotes(List<NoteEntity> notes) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _key,
      notes.map((note) => '${note.title}#${note.description}').toList(),
    );
  }

  Future<List<String>> getNotes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }
}

final storageProvider = Provider((ref) => StorageService());
