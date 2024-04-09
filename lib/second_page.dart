import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_listmap_239/notes_provider.dart';

import 'counter_provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          /// set the data
          ///
          context.read<NotesProvider>().addNote("Note title", "Note Desc");
          //Provider.of<NotesProvider>(context, listen: false).addNote(title, desc)
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
