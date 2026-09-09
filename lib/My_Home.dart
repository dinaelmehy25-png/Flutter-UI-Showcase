  import 'package:flutter/material.dart';

class Myhome extends StatelessWidget {
  const Myhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Exercises"),
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.notifications_none),
          SizedBox(width: 15),
        ],    
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: EdgeInsets.all(20),
             
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, dondon! ",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  
                      SizedBox(height: 10),
                  
                      Text(
                        "Complete your exercises\n and keep learning,Baby",
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 18, 109, 116),
                        ),
                      ),
                    ],
                  ),
               SizedBox(width: 20),
                CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1mhOkgKRfjmtdpciTGwWHhCc-qQt9TlVtL5GdvZa4-HU8O5uJjtEJzd0&s"), 
              ),
                ], 
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Your Exercises",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),

            SizedBox(height: 15),

            exerciseItem(
              Icons.code,
              "Flutter Basics",
              "Understand widgets and build\nyour first UI",
              "Completed",
            ),

            exerciseItem(
              Icons.phone_android,
              "Layout Widgets",
              "Practice Column, Row, Container\nand more",
              "In Progress",
            ),

            exerciseItem(
              Icons.image,
              "Image & Icons",
              "Use NetworkImage and\nIcon widgets",
              "Not Started",
            ),

            exerciseItem(
              Icons.text_fields,
              "Text & Styling",
              "Work with Text widget and\ntext styles",
              "Not Started",
            ),

            exerciseItem(
              Icons.star_border,
              "Divider & Padding",
              "Add spacing and dividers\nto your UI",
              "Not Started",
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Exercises",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Progress",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget exerciseItem(
    IconData icon,
    String title,
    String description,
    String status,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Divider(),

          Row(
            children: [

              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue.shade50,
                child: Icon(
                  icon,
                  size: 35,
                  color: Colors.blue,
                ),
              ),

              SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),

              Column(
                children: [
                  Text(
                    status,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                    ),
                  ),

                  SizedBox(height: 10),

                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
                              
          SizedBox(height: 10),
        ],
      ),
    );
 } 
}              


