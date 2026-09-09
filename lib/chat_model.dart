class ChatModel {
  int? id;
  String? name;
  String? message; 
  String? time;
  String? image;
  ChatType? messageType;

  ChatModel({
    this.id,
    this.name,
    this.message,
    this.time,
    this.image,
    this.messageType,
  });

  ChatModel.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    message = json["message"];
    time = json["time"];
    image = json["image"];
    messageType = getChatType(json["message_type"]);
  }
}
enum ChatType { text, video, gif }

ChatType getChatType(String chatType) {
  switch (chatType) {
    case "text":
      return ChatType.text;
    case "video":
      return ChatType.video;

    default:
      return ChatType.gif;
  }
}
