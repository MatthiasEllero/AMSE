import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: Text("test"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Text("test"),
        bottomNavigationBar: BottomNavigationBar(items: const [])));
  }
}
