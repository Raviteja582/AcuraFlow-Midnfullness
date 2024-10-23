import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotepadScreen extends StatefulWidget {
  const NotepadScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotepadScreenState createState() => _NotepadScreenState();
}

class _NotepadScreenState extends State<NotepadScreen> {
  TextEditingController noteController = TextEditingController();
  List<String> notes = [];
  int selectedNoteIndex = -1;

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  void loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      notes = prefs.getStringList('notes') ?? [];
    });
  }

  void saveNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('notes', notes);
  }

  void deleteNote() {
    if (selectedNoteIndex != -1) {
      setState(() {
        notes.removeAt(selectedNoteIndex);
        noteController.clear();
        selectedNoteIndex = -1;
        saveNotes();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
        ),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Text(
              'Keep it Secured from curios eyes!',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Text(
              'Share experiences that evoked happiness, sadness or excitement in you.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: noteController,
              maxLines: 10,
              textAlign: TextAlign.start,
              decoration: const InputDecoration(
                labelText: 'The MindFul Diary..',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.end, // Align buttons to the right
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  fixedSize: const Size(100.0, 40.0),
                  side: const BorderSide(color: Colors.grey, width: 2.0),
                ),
                onPressed: () {
                  String note = noteController.text;
                  if (note.isNotEmpty) {
                    if (selectedNoteIndex != -1) {
                      notes[selectedNoteIndex] = note;
                      selectedNoteIndex = -1;
                    } else {
                      notes.add(note);
                    }
                    noteController.clear();
                    saveNotes();
                    setState(() {});
                  }
                },
                child: Text(selectedNoteIndex != -1 ? 'Edit/Save' : 'Save'),
              ),
              const SizedBox(width: 10), // Add spacing between buttons
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  fixedSize: const Size(100.0, 40.0),
                  side: const BorderSide(color: Colors.grey, width: 2.0),
                ),
                onPressed: () {
                  noteController.clear();
                  selectedNoteIndex = -1;
                },
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 18),
            ],
          ),
          Expanded(
              child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(notes[index]),
                  onTap: () {
                    noteController.text = notes[index];
                    setState(() {
                      selectedNoteIndex = index;
                    });
                  },
                  trailing: ElevatedButton(
                    onPressed: () {
                      deleteNote();
                      notes.removeAt(index);
                      saveNotes();
                      setState(() {});
                    },
                    child: const Icon(
                      Icons.delete,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
