import 'package:flutter/material.dart';
import 'package:inout_training/core/app_storage/app_storage.dart';
import 'package:inout_training/features/add_note/view.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: AppStorage.getNotes().length,
        itemBuilder: (context, index) => ListTile(
          title: Text(AppStorage.getNotes()[index]),
          onTap: () async {
            final result = await Navigator.push(context, MaterialPageRoute(builder: (context) =>
              AddNoteView(
                index: index,
                oldNote: AppStorage.getNotes()[index],
              ),));
            if(result != null){
              setState(() {});
            }
          },
          onLongPress: (){
            AppStorage.removeNote(index);
            setState(() {});
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNoteView(),
            ),
          );
          if(result != null){
            setState(() {});
          }

        },
      ),
    );
  }
}
