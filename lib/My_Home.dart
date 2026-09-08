import 'package:flutter/material.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: [
        
              const SizedBox(height: 20),
        
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeTyyup0t9Ea1GAZQh1Od-091MXH4FhjepZUytDojlAg&s=10"),
              ),
        
              const SizedBox(height: 10),
        
              const Text(
                "dena elmehy",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
        
              const SizedBox(height: 5),
        
              const Text(
                "Flutter Developer",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.blue,
                ),
              ),
        
              const SizedBox(height: 15),
        
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xffEAF3FF),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    const Text(
                      "👤  Welcome to my profile",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
        
                    const Divider(),
        
                    const SizedBox(height: 20),
        
                    const Text(
                      "I am learning Flutter and building "
                      "awesome mobile applications.\n"
                      "This is a simple profile screen built "
                      "with Flutter using basic widgets.",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
     
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      centerTitle: true,
      title: const Text(
        " My Profile ",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
