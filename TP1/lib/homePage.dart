import "package:flutter/material.dart";
import "media.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return (Text(listeMedia[0].name));
  }
}
