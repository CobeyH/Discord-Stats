import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:discord_stats/models/conversation.dart';
import 'package:discord_stats/providers/conversation_mappings_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/conversation_user_mapping.dart';
import '../models/message.dart';
import 'archive_provider.dart';

part 'conversation_provider.g.dart';

@riverpod
class Conversations extends _$Conversations {
  @override
  List<Conversation> build() {
    Archive? archive = ref.watch(archiveProvider);
    if (archive == null) {
      return [];
    }
    List<ConversationUserMapping> mappings =
        ref.watch(fetchConversationMappingsProvider);
    List<ArchiveFile> messageFiles = archive.files
        .where((file) => file.name.startsWith('messages/'))
        .toList();
    Set<String> ids =
        messageFiles.map((file) => file.name.split('/')[1]).toSet();

    List<Conversation> conversations = ids
        .map((String id) {
          ArchiveFile? channelFile =
              archive.findFile('messages/$id/channel.json');
          ArchiveFile? messagesFile =
              archive.findFile('messages/$id/messages.json');
          if (channelFile == null || messagesFile == null) {
            return null;
          }

          var channelData = jsonDecode(utf8.decode(channelFile.content));
          var messagesData = jsonDecode(utf8.decode(messagesFile.content));
          ConversationType type = ConversationType.fromInt(channelData['type']);
          String conversationId = channelData['id'];
          List<Message> messages = messagesData
              .map((messageData) => Message.fromJson(messageData))
              .toList()
              .cast<Message>();
          return Conversation(
              id: conversationId,
              type: type,
              recipients: [],
              messages: messages,
              name: mappings
                  .firstWhere((mapping) => mapping.id == conversationId)
                  .name);
        })
        .where((conversation) => conversation != null)
        .toList()
        .cast<Conversation>();
    return conversations;
  }
}
