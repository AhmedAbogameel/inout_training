import 'package:get_storage/get_storage.dart';

abstract class AppStorage {

  static const String _BOX = 'Notes';
  static GetStorage _box = GetStorage();

  static Future<void> init() async =>
    await GetStorage.init();

  static Future<void> addNote(String value) async {
    final notes = getNotes();
    notes.insert(0, value);
    await _box.write(_BOX, notes);
  }

  static void _updateNotes (List notes) => _box.write(_BOX, notes);

  static List getNotes() => _box.hasData(_BOX) ? _box.read(_BOX) : [];

  static void removeNote(int index) {
    final notes = getNotes();
    notes.removeAt(index);
    _updateNotes(notes);
  }

  static Future<void> updateNote(int index, String note) async {
    final notes = getNotes();
    notes[index] = note;
    _updateNotes(notes);
  }

}