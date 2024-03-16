import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:discord_stats/models/conversation_user_mapping.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'archive_provider.dart';

part 'conversation_mappings_provider.g.dart';

@riverpod
List<ConversationUserMapping> fetchConversationMappings(
    FetchConversationMappingsRef ref) {
  Archive? archive = ref.watch(archiveProvider);
  if (archive == null) {
    return [];
  }
  ArchiveFile? mappingsFile = archive.findFile("messages/index.json");
  if (mappingsFile == null || !mappingsFile.isFile) {
    throw Exception("No index.json file found in the archive");
  }
  List<int> data = mappingsFile.content as List<int>;
  String jsonString = String.fromCharCodes(data);
  Map<String, dynamic> jsonMap = jsonDecode(jsonString);
  List<ConversationUserMapping> mappings = [];
  jsonMap.forEach((key, value) {
    mappings.add(ConversationUserMapping(id: key, name: value));
  });
  return mappings;
}
