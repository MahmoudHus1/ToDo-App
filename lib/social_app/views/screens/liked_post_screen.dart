import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/social_app/models/post_model.dart';

import '../../repositories/dummy_data.dart';
import '../widget/post_widget.dart';

class LikedPostsScreen extends StatefulWidget {
  @override
  State<LikedPostsScreen> createState() => _LikedPostsScreenState();
}

class _LikedPostsScreenState extends State<LikedPostsScreen> {
checkLiked(PostModel postModel) {
      int index = posts.indexOf(postModel);
      posts[index].isFavourite = !posts[index].isFavourite!;
      setState(() {});
    }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.where((element) => element.isFavourite!).length,
        itemBuilder: (context, index) {
          return PostWidget(
              postModel : posts.where((element) => element.isFavourite!).toList()[index], function : checkLiked);
        });
  }
}