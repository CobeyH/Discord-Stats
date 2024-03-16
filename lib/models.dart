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
