import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'whatsapp_text_styles.dart';
import 'chat_model.dart';
import 'api_list.dart';
class Myhome extends StatelessWidget {
  const Myhome({super.key});

  @override
  Widget build(BuildContext context) {
     List<ChatModel> chats = apiChats.map((e) => ChatModel.fromJson(e)).toList();
    return Scaffold(
      appBar: _appBar(),
      floatingActionButton: Column(
  mainAxisSize: MainAxisSize.min,
  children: [
      FloatingActionButton(
      onPressed: null,
      backgroundColor: const Color(0xff202529),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Icon(
        Icons.smart_toy,
        color: Colors.purple,
      ),
    ),

         SizedBox(height: 15),

       FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ), 
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
          ),         
          child: Icon(
            Icons.add, 
            color: Colors.green,
            )
          ),
      ),
  ] ),

       body: Padding(
        padding: EdgeInsets.all(4),
        child: Column(
          children: [

      // Search Bar
      Padding(
        padding: const EdgeInsets.all(10),

        child: Container(
          height: 40,
          width: double.infinity,

          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),

          decoration: BoxDecoration(
            color:  Color(0xff252A2D),
            borderRadius: BorderRadius.circular(30),
          ),

          child: Row(
            children: [

              // Search Icon
              Icon(
                Icons.search,
                color: Colors.grey,
                size: 35,
              ),

             SizedBox(width: 15),

              // Search Text
              Text(
                "Ask Meta AI or Search",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),  
      ),

     Padding(
      padding: const EdgeInsets.all(10),
     child: Row(
       spacing: 20,
        crossAxisAlignment: .start,
        children: [
           Icon(Icons.archive_outlined, color: Colors.grey),
        Text("Archived", style:TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey, 
        )
        ),
        Spacer(),
        Text("1",
       style: WhatsappTextStyles.msgTextStyle,
      ),
        ],
     ),
      ),
      Expanded(
              child: ListView.separated(
                itemCount: chats.length,
                separatorBuilder: (context, index) => SizedBox(height: 10,),
                itemBuilder: (context, i) => _myChat(chats[i]),
              ),
            ),
    ],
  ),
       ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff0B141A), 
        currentIndex: 1,
        selectedItemColor: Colors.green,
        unselectedItemColor:Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update_outlined),
            label: "Updates",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_outlined),
            label: "Communities",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_outlined),
            label: "Calls",
          ),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Color(0xff202C33),
      foregroundColor: Colors.white,
      title: Text("WhatsApp"),
      centerTitle: false,
       actions: [
        Icon(Icons.camera_alt_outlined),
        SizedBox(width: 15),
        Icon(Icons.more_vert),
        SizedBox(width: 5),
      ], 
    );
  }
  Widget _myChat(ChatModel chat) {
    return Row(
      spacing: 10,
      crossAxisAlignment: .start,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(chat.image ?? ""),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            children: [
          
              Text(chat.name ?? "", style: WhatsappTextStyles.titleTextStyle),
              _messageBuilder(chat),
          
            ],
          ),
        ),
        Spacer(),
        Text(chat.time ?? "", style: WhatsappTextStyles.msgTextStyle),
      ],
    );
  }
  
  Widget _messageBuilder(ChatModel chat) {
    if (chat.messageType == ChatType.text) {
      return Text(chat.message ?? "", style: WhatsappTextStyles.msgTextStyle,maxLines: 1, overflow: TextOverflow.ellipsis);
    } else if (chat.messageType == ChatType.video) {
      return Row(
        children: [
          Icon(CupertinoIcons.video_camera),
          Text("Video", style: WhatsappTextStyles.msgTextStyle),
        ],
      );
    } else {
      return Row(
        children: [
          Icon(Icons.gif),
          Text("Gif", style: WhatsappTextStyles.msgTextStyle),
        ],
      );
    }
  }
}

 

 