import 'package:discord_stats/providers/conversation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/conversation.dart';

class TopConversations extends ConsumerWidget {
  const TopConversations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Conversation> conversations = ref.watch(conversationsProvider);
    conversations.sort((a, b) => b.messages.length - a.messages.length);
    return ListView(
      children: conversations
          .map((conversation) => ListTile(
                title: Text(conversation.name),
                subtitle: Text(conversation.messages.length.toString()),
              ))
          .toList(),
    );
  }
}
