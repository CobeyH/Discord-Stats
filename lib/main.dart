import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:archive/archive.dart';

void main() {
  runApp(const MyApp());
}

class ConversationIdMapping {
  final String id;
  final String? name;

  ConversationIdMapping({
    required this.id,
    this.name,
  });

  @override
  String toString() {
    return 'ConversationMapping ID: $id, name: $name}';
  }
}

class Message {
  final String id;
  final DateTime timestamp;
  final String contents;
  final String attachments;

  Message({
    required this.id,
    required this.timestamp,
    required this.contents,
    required this.attachments,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['ID'],
      timestamp: DateTime.parse(json['Timestamp']),
      contents: json['Contents'],
      attachments: json['Attachments'],
    );
  }
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform
                .pickFiles(type: FileType.custom, allowedExtensions: ['zip']);
            List<ConversationIdMapping> mappings = [];
            if (result != null) {
              Uint8List? bytes = result.files.single.bytes;
              Archive archive = ZipDecoder().decodeBytes(bytes!);
              ArchiveFile? mappingsFile =
                  archive.findFile("messages/index.json");
              if (mappingsFile != null && mappingsFile.isFile) {
                List<int> data = mappingsFile.content as List<int>;
                String jsonString = String.fromCharCodes(data);
                Map<String, dynamic> jsonMap = jsonDecode(jsonString);
                jsonMap.forEach((key, value) {
                  mappings.add(ConversationIdMapping(id: key, name: value));
                });
              } else {
                print("No index.json file found in the archive");
              }
              print(mappings);
              // for (ArchiveFile file in archive) {
              //   String filename = file.name;
              //   if (file.isFile) {
              //     List<int> data = file.content as List<int>;
              //     // Do something with the data
              //   } else {
              //     // Handle directories
              //   }
              // }
            }
          },
          child: const Text('Open Dropzone'),
        ),
      ),
    );
  }
}
