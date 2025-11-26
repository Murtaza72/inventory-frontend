import 'package:flutter/material.dart';

import 'login_tab.dart';
import 'register_tab.dart';

class AuthTabScreen extends StatefulWidget {
  static String routeName = "/auth";

  @override
  State<AuthTabScreen> createState() => _AuthTabScreenState();
}

class _AuthTabScreenState extends State<AuthTabScreen> {
  List<Map<String, dynamic>> screens = [];

  int screenIndex = 0;

  void changeScreen(int index) {
    setState(() {
      screenIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    screens = [
      {"page": LoginTab(), "title": "Login"},
      {"page": RegisterTab(), "title": "Register"},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(screens[screenIndex]["title"])),
      body: screens[screenIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: const Color.fromARGB(255, 189, 180, 57),
        currentIndex: screenIndex,
        items: [
          BottomNavigationBarItem(
            label: "Login",
            icon: Icon(Icons.login),
          ),
          BottomNavigationBarItem(
            label: "Register",
            icon: Icon(Icons.create),
          ),
        ],
      ),
    );
  }
}
