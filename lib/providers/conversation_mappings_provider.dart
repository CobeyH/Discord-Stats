import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:discord_stats/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'conversation_mappings_provider.g.dart';

@riverpod
List<ConversationIdMapping> fetchConversationMappings(
    FetchConversationMappingsRef ref, Archive archive) {
  ArchiveFile? mappingsFile = archive.findFile("messages/index.json");
  if (mappingsFile == null || !mappingsFile.isFile) {
    throw Exception("No index.json file found in the archive");
  }
  List<int> data = mappingsFile.content as List<int>;
  String jsonString = String.fromCharCodes(data);
  Map<String, dynamic> jsonMap = jsonDecode(jsonString);
  List<ConversationIdMapping> mappings = [];
  jsonMap.forEach((key, value) {
    mappings.add(ConversationIdMapping(id: key, name: value));
  });
  return mappings;
}
