import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_listmap_239/counter_provider.dart';
import 'package:provider_listmap_239/notes_provider.dart';
import 'package:provider_listmap_239/second_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
    create: (context) => NotesProvider(),
    child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    print("build function called!");

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<NotesProvider>(
              builder: (_, provider, __){
                return provider.getNotes().isNotEmpty ? ListView.builder(
                    itemCount: provider.getNotes().length,
                    itemBuilder: (_, index){

                      Map<String, dynamic> eachNote = provider.getNotes()[index];
                      return ListTile(
                        onTap: (){
                          context.read<NotesProvider>().updateNote("Updated note", "Updated Desc", index);
                        },
                        title: Text(eachNote['title']),
                        subtitle: Text(eachNote['desc']),
                      );
                    }) : Center(child: Text('No Notes yet!!'),);
              },
            ),
          ),
          ElevatedButton(onPressed: (){}, child: Text('Next')),
          ElevatedButton(onPressed: (){}, child: Text('Next'))
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(),));
        },
        child: Text('Add'),
      ),
    );
  }
}


