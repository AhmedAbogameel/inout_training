import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final String name;
  final String image;
  CharacterCard({required this.name, required this.image});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(image),
        Text(name),
      ],
    );
  }
}
