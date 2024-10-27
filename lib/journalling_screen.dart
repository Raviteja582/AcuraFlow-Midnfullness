import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotepadScreen extends StatefulWidget {
  const NotepadScreen(this.title, {super.key});
  final String title;
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
          title: Text(
            widget.title,
            style: const TextStyle(fontFamily: 'Playwrite'),
          ),
          foregroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/background.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: Text(
                      'Keep it Secured from curios eyes!',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Playwrite',
                        color: Colors.white,
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
                        fontFamily: 'Playwrite',
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      style: const TextStyle(
                          fontSize: 22.0,
                          color: Color(0xFFbdc6cf),
                          fontFamily: 'Playwrite'),
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
                        MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: const EdgeInsets.all(20.0),
                          backgroundColor:
                              Colors.black,
                          foregroundColor: Colors.white,
                          side:
                              const BorderSide(color: Colors.grey, width: 2.0),
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
                        child: Text(
                          selectedNoteIndex != -1 ? 'Edit/Save' : 'Save',
                          style: const TextStyle(
                            fontFamily: 'Playwrite',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: const EdgeInsets.all(20.0),
                          backgroundColor:
                              Colors.black,
                          foregroundColor: Colors.white,
                          side:
                              const BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        onPressed: () {
                          noteController.clear();
                          selectedNoteIndex = -1;
                        },
                        child: const Text('Clear',
                            style: TextStyle(
                                fontSize: 16.0, fontFamily: 'Playwrite')),
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
                          title: Text(
                            notes[index],
                            style: const TextStyle(fontFamily: 'Playwrite'),
                          ),
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
            )
          ],
        ));
  }
}
