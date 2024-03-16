import 'message.dart';

enum ConversationType { channelText, directMessage, channelVoice, groupDM }

class Conversation {
  final String id;
  final ConversationType type;
  final List<String> recipients;
  final List<Message> messages;

  Conversation({
    required this.id,
    required this.type,
    required this.recipients,
    required this.messages,
  });
}
