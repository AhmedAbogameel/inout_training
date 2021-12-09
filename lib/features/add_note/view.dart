import 'package:flutter/material.dart';
import 'package:inout_training/core/app_storage/app_storage.dart';

class AddNoteView extends StatefulWidget {

  final String? oldNote;
  final int? index;

  AddNoteView({
    this.oldNote,
    this.index
  });

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {

  final formKey = GlobalKey<FormState>();
  TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    if(widget.oldNote != null)
      noteController = TextEditingController(text: widget.oldNote);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: formKey,
              child: TextFormField(
                controller: noteController,
                // onSaved: (value) {
                //   note = value!;
                // },
                validator: (value) => value!.isEmpty ? 'Invalid Input!' : null,
                decoration: InputDecoration(
                  hintText: 'Note'
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                if(!formKey.currentState!.validate()) return;
                // formKey.currentState!.save();
                if(widget.oldNote == null) {
                  await AppStorage.addNote(noteController.text);
                } else {
                  await AppStorage.updateNote(widget.index!, noteController.text);
                }
                Navigator.pop(context, noteController.text);
              },
              child: Text( widget.oldNote == null ? 'Add' : 'Edit') ,
            ),
          ],
        ),
      ),
    );
  }
}
