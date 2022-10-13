import 'package:flutter/material.dart';
import 'package:flutter_application_1/social_app/models/post_model.dart';
import 'package:flutter_application_1/social_app/views/widget/post_widget.dart';

import '../../repositories/dummy_data.dart';

class AllPostsScreen extends StatefulWidget {
  @override
  State<AllPostsScreen> createState() => _AllPostsScreenState();
}

class _AllPostsScreenState extends State<AllPostsScreen> {
  checkLiked(PostModel postModel) {
      int index = posts.indexOf(postModel);
      posts[index].isFavourite = !posts[index].isFavourite!;
      setState(() {});
    }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: posts.length,itemBuilder: (context, index) {
      return PostWidget(postModel : posts[index], function : checkLiked);
    },);
  }
}