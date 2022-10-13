import 'dart:developer';

import 'package:flutter/material.dart';

import 'all_post_screen.dart';
import 'liked_post_screen.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: MainSocialAppScreen(),
  ));
}

class MainSocialAppScreen extends StatefulWidget {
  const MainSocialAppScreen({super.key});

  @override
  State<MainSocialAppScreen> createState() => _MainSocialAppScreenState();
}

class _MainSocialAppScreenState extends State<MainSocialAppScreen> {
  PageController pageController = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Social Media App')),
      body: PageView(
          controller: pageController,
          children: [AllPostsScreen(), LikedPostsScreen()]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
            pageController.animateToPage(index,
                duration: const Duration(microseconds: 100), curve: Curves.linear);
          },
          items: const  [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favourite'),
          ]),
    );
  }
}