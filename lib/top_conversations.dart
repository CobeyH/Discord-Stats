import 'package:discord_stats/providers/conversation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/conversation.dart';

class TopConversations extends ConsumerStatefulWidget {
  const TopConversations({Key? key}) : super(key: key);

  @override
  TopConversationsState createState() => TopConversationsState();
}

class TopConversationsState extends ConsumerState<TopConversations> {
  String searchQuery = "";

  List<Conversation> getFilteredConversations(
      List<Conversation> conversations) {
    if (searchQuery.isEmpty) {
      return conversations;
    }
    conversations.sort((a, b) => b.messages.length - a.messages.length);
    return conversations.where((conversation) {
      return conversation.name
          .toLowerCase()
          .contains(searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Conversation> conversations = ref.watch(conversationsProvider);
    List<Conversation> filteredConversations =
        getFilteredConversations(conversations);

    return Column(children: [
      TextField(
        onChanged: (value) => setState(() => searchQuery = value),
        decoration: InputDecoration(
          labelText: "Search",
          hintText: "Search",
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      ListView.builder(
        itemCount: filteredConversations.length,
        itemBuilder: (context, index) => ListTile(
          title: Text("#$index ${filteredConversations[index].name}"),
          subtitle:
              Text(filteredConversations[index].messages.length.toString()),
        ),
      )
    ]);
  }
}
