import 'package:discord_stats/models/message.dart';
import 'package:discord_stats/providers/conversation_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'messages_provider.g.dart';

@riverpod
List<Message> fetchMessages(FetchMessagesRef ref) {
  return ref.watch(conversationsProvider).expand((conversation) {
    return conversation.messages;
  }).toList();
}
