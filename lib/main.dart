import 'dart:typed_data';

import 'package:discord_stats/activity_over_time.dart';
import 'package:discord_stats/providers/archive_provider.dart';
import 'package:discord_stats/top_conversations.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:archive/archive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'day_of_week.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Discord Stats',
      theme: ThemeData(
        brightness: Brightness.dark,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
    Archive? archive = ref.watch(archiveProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Discord Stats"),
      ),
      body: archive == null
          ? Center(
              child: ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(
                          type: FileType.custom, allowedExtensions: ['zip']);
                  if (result != null) {
                    Uint8List? bytes = result.files.single.bytes;
                    Archive archive = ZipDecoder().decodeBytes(bytes!);
                    ref.read(archiveProvider.notifier).setArchive(archive);
                  }
                },
                child: const Text('Select file'),
              ),
            )
          : const ActivityOverTime(),
    );
  }
}
