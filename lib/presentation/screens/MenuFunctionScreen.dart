import 'package:flutter/material.dart';
import 'package:pets_go/Data/sample_posts.dart';
import 'package:pets_go/Models/pet_post.dart';
import 'package:pets_go/Theme/AppBackground.dart';
import 'package:pets_go/Widgets/Drawer.dart';
import 'package:pets_go/Widgets/pet_post_card.dart';

class MenuFunctionScreen extends StatefulWidget {
  const MenuFunctionScreen({super.key});

  @override
  State<MenuFunctionScreen> createState() => _MenuFunctionScreenState();
}

class _MenuFunctionScreenState extends State<MenuFunctionScreen> {
  late List<PetPost> _posts;

  @override
  void initState() {
    super.initState();
    _posts = List<PetPost>.from(samplePosts);
  }

  void _incrementLikes(int index) {
    setState(() {
      if (index >= 0 && index < _posts.length) {
        _posts[index].likes++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PetsGo',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.lightBlueAccent.withOpacity(0.7),
        elevation: 0,
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: AppBackground(
        child: ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            return PetPostCard(
              post: _posts[index],
              onLike: () => _incrementLikes(index),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
