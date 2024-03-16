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
      id: json['ID'].toString(),
      timestamp: DateTime.parse(json['Timestamp']),
      contents: json['Contents'],
      attachments: json['Attachments'],
    );
  }
}
