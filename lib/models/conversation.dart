import 'message.dart';

enum ConversationType {
  guildText("Server Text", 0),
  dM("Direct Message", 1),
  guildVoice("Server Voice", 2),
  groupDm("Group Direct Message", 3),
  guildCategory("Server Category", 4),
  guildAnnouncement("Server Announcement", 5),
  announcementThread("Announcement Thread", 10),
  publicThread("Public Thread", 11),
  privateThread("Private Thread", 12),
  serverStageVoice("Server Stage Voice", 13),
  serverDirectory("Server Directory", 14),
  serverForum("Server Forum", 15),
  serverMedia("Server Media", 16);

  const ConversationType(String display, int id);

  static ConversationType fromInt(int value) {
    switch (value) {
      case 0:
        return guildText;
      case 1:
        return dM;
      case 2:
        return guildVoice;
      case 3:
        return groupDm;
      case 4:
        return guildCategory;
      case 5:
        return guildAnnouncement;
      case 10:
        return announcementThread;
      case 11:
        return publicThread;
      case 12:
        return privateThread;
      case 13:
        return serverStageVoice;
      case 14:
        return serverDirectory;
      case 15:
        return serverForum;
      case 16:
        return serverMedia;
      default:
        throw Exception("Invalid ConversationType value");
    }
  }
}

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
