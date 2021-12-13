import 'package:flutter/material.dart';
import 'package:inout_training/models/character.dart';
import 'package:inout_training/views/home/controller.dart';
import 'package:inout_training/widgets/character_card.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  HomeController controller = HomeController();
  List<Character> characters = [];
  bool isLoading = true;

  @override
  void initState() {
    getCharacters();
    super.initState();
  }

  void getCharacters() async {
    characters = await controller.getCharacters();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading ? Center(child: CircularProgressIndicator()) : ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return CharacterCard(
            image: characters[index].image!,
            name: characters[index].name!,
          );
        },
      ),
    );
  }
}
