import 'package:flutter/material.dart';

void main() {
  runApp(const NotepadApp());
}

class NotepadApp extends StatelessWidget {
  const NotepadApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notepad',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NotepadHomePage(),
    );
  }
}

class NotepadHomePage extends StatefulWidget {
  const NotepadHomePage({Key? key}) : super(key: key);

  @override
  State<NotepadHomePage> createState() => _NotepadHomePageState();
}

class _NotepadHomePageState extends State<NotepadHomePage> {
  final TextEditingController _controller = TextEditingController();

  void _saveNote() {
    final String text = _controller.text;
    // For this simple example, we just show a snackbar.
    // You can extend this to save notes to local storage or cloud.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Note saved locally')),
    );
    // Normally you'd save the text persistently here
  }

  void _clearNote() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notepad'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            tooltip: 'Save Note',
            onPressed: _saveNote,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Clear Note',
            onPressed: _clearNote,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          controller: _controller,
          maxLines: null,
          expands: true,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Write your note here...',
          ),
        ),
      ),
    );
  }
}
