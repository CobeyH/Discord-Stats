import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:archive/archive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/conversation_user_mapping.dart';

void main() {
  runApp(const MyApp());
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Discord Stats"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform
                .pickFiles(type: FileType.custom, allowedExtensions: ['zip']);
            List<ConversationUserMapping> mappings = [];
            if (result != null) {
              Uint8List? bytes = result.files.single.bytes;
              Archive archive = ZipDecoder().decodeBytes(bytes!);
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
