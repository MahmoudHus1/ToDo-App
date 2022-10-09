import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: MyPostScreen(),
  ));
}

class MyPostScreen extends StatefulWidget {
  const MyPostScreen({super.key});

  @override
  State<MyPostScreen> createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<MyPostScreen> {
  bool isDark = false;
  String content = '';
  List<String> comments = [];
  @override
  void initState() {
    super.initState();
    log('initState method');
    isDark = true;
  }

  @override
  Widget build(BuildContext context) {
    log('build method');
    return Theme(
      data: isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('GSK west bank'),
          ),
          body: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Emblem-person-blue.svg/1200px-Emblem-person-blue.svg.png'),
                      radius: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Mahmoud Hussein'),
                          Text('Since 23 minuites')
                        ],
                      ),
                    ),
                    CupertinoSwitch(
                      value: isDark,
                      onChanged: (d) {
                        isDark = d;
                        setState(() {});
                      },
                    )
                  ],
                ),
              ),
              Container(
                height: 400,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://geographical.co.uk/wp-content/uploads/somalaya-mountain-range-title.jpg'))),
              ),
              Container(
                  margin: const EdgeInsets.all(10), child: const IsLikedButton()),
              const Text('Hello this is my first post'),
              const AcceptConditions(),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        content = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        comments.add(content);
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      height: 60,
                      width: 50,
                      child: const Icon(Icons.send),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ...comments.map((e) {
                return Text(e);
              }).toList(),
            ],
          )),
    );
  }
}

class AcceptConditions extends StatefulWidget {
  const AcceptConditions({super.key});

  @override
  State<AcceptConditions> createState() => _AcceptConditionsState();
}

class _AcceptConditionsState extends State<AcceptConditions> {
  bool isAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Checkbox(
              value: isAccepted,
              onChanged: (value) {
                isAccepted = value!;
                setState(() {});
              }),
          const SizedBox(
            width: 10,
          ),
          const Text('Accept Conditions')
        ],
      ),
    );
  }
}

class IsLikedButton extends StatefulWidget {
  const IsLikedButton({super.key});

  @override
  State<StatefulWidget> createState() {
    return IsLikedButtonState();
  }
}

class IsLikedButtonState extends State<IsLikedButton> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isLiked = !isLiked;

        setState(() {});
      },
      child: Icon(
        Icons.favorite,
        size: 80,
        color: isLiked ? Colors.red : Colors.grey,
      ),
    );
  }
}
