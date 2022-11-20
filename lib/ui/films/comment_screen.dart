import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';

class TestMe extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _TestMeState createState() => _TestMeState();
}

class _TestMeState extends State<TestMe> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'Adeleye Ayodeji',
      'pic': 'https://truyenvua.com/128/fix-1061/1.jpg',
      'message': 'I love to code'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://truyenvua.com/128/fix-1061/1.jpg',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://truyenvua.com/128/fix-1061/1.jpg',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://truyenvua.com/128/fix-1061/1.jpg',
      'message': 'Very cool'
    },
  ];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  // ignore: avoid_print
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius:  BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(data[i]['pic'] + "$i")),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comment Page"),
        backgroundColor: Colors.pink,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: CommentBox(
          userImage:
              "https://truyenvua.com/128/fix-1061/1.jpg",
          labelText: 'Write a comment...',
          withBorder: false,
          errorText: 'Comment cannot be blank',
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              // ignore: avoid_print
              print(commentController.text);
              setState(() {
                var value = {
                  'name': 'New User',
                  'pic':
                      'https://truyenvua.com/128/fix-1061/1.jpg',
                  'message': commentController.text
                };
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              // ignore: avoid_print
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          sendWidget: const Icon(Icons.send_sharp, size: 30, color: Colors.white),
          child: commentChild(filedata),
        ),
      ),
    );
  }
}