import 'package:flutter/foundation.dart';

class NotesProvider extends ChangeNotifier{

  List<Map<String, dynamic>> _notes = [];

  ///to add into list
  void addNote(String title, String desc){
    _notes.add({
      "title" : title,
      "desc" : desc,
    });
    notifyListeners();
  }

  ///update
  void updateNote(String updatedTitle, String updatedDesc, int index){
    _notes[index] = {
      "title" : updatedTitle,
      "desc" : updatedDesc,
    };

    notifyListeners();
  }
  ///delete

  ///to fetch all the notes
  List<Map<String,dynamic>> getNotes(){
    return _notes;
  }


}