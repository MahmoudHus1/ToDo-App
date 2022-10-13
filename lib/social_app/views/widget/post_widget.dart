import 'package:flutter/material.dart';
import 'package:flutter_application_1/social_app/models/post_model.dart';

class PostWidget extends StatefulWidget {
  final PostModel postModel;
  final Function function;
   PostWidget({required this.postModel, required this.function} );
  
  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.postModel.postUserModel!.image!),
                radius: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.postModel.postUserModel!.name!),
                  const Text('Since 23 minuites')
                ],
              )
            ],
          ),
        ),
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(widget.postModel.image!))),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    widget.function(widget.postModel);
                  });
                },
                child: Icon(
                  Icons.favorite,
                  size: 30,
                  color: widget.postModel.isFavourite! ? Colors.red : Colors.grey,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.share,
                size: 30,
              )
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(widget.postModel.content ?? '')),
        const Divider()
      ],
    );
  }
}
