import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'massenger_text_styles.dart';
class Myhome extends StatelessWidget {
  const Myhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
body: Padding(
  padding: EdgeInsets.all(3),
        child: Column(
          children: [

      // Search Bar
      Padding(
        padding: const EdgeInsets.all(15),

        child: Container(
          height: 40,
          width: double.infinity,

          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),

          decoration: BoxDecoration(
            color:   Colors.grey[200],
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
                "Search",
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
      padding: const EdgeInsets.symmetric(horizontal: 10),
     child: 
      SizedBox(
  height: 80,
  child: ListView.separated(
    itemCount: 10,
   scrollDirection: Axis.horizontal,
    separatorBuilder: (context, index) => SizedBox(width: 10,),
    itemBuilder:(context, index) => CircleAvatar(
            radius: 35,
           backgroundColor: Colors.blue,
          child: CircleAvatar(
             radius: 31,
             backgroundColor: Colors.white,
           child: CircleAvatar(
             radius: 27,
            backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmLRWQ1KG9zd0QcK_8cRE6bv1iqHtey38EN_WCOdothA&s=10")
          )
          )
          ),),
) ,     
          
    ) ,
    SizedBox(height: 10,),
      Expanded(
              child: ListView.separated(
                itemCount: 40,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) => _myChat(),
              ),
            ),
          

        ]
         
         
           
          )


),

);
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.white,
      leading: 
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: CircleAvatar(
           radius: 35,
           backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFpqCHELUjW3PBJkQhGclBz8x00ROEoIppp-8-0NYAUA&s=10"),
        ),
      ),
      title: Text("Chats",
       style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
      centerTitle: false,
      actions: [CircleAvatar(child:
       Icon(Icons.camera_alt_outlined,),
       backgroundColor: const Color.fromARGB(255, 234, 227, 227),),
       SizedBox(width: 10,),
       CircleAvatar(child:
       Icon(Icons.archive_outlined,),
       backgroundColor: const Color.fromARGB(255, 234, 227, 227),)
      ]
    );
  }
    Widget _myChat() {
    return Row(
      spacing: 10,
      crossAxisAlignment: .start,
      children: [
        CircleAvatar(radius: 25, backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpGkLGYfcdTGPbDJQHiOZzrMZZ9xjyZh2TCDSWdNx6eg&s=10")),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text("dena", style: MassengerTextStyles.titleTextStyle),
            Text("Hello from flutter", style: MassengerTextStyles.msgTextStyle),
          ],
        ),
        Spacer(),
        Text("11:55 PM", style: MassengerTextStyles.msgTextStyle),
      ],
    );
  }
}
