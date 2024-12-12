import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {
                context.go("/home");
              },
              icon: Icon(
                CupertinoIcons.home,
                color: Colors.black,
                size: 30,
              )),
          IconButton(
              onPressed: () {
                context.go("/lesson");
              },
              icon: Icon(
                CupertinoIcons.book,
                color: Colors.black,
                size: 30,
              )),
          IconButton(
              onPressed: () {
                context.go("/statistics");
              },
              icon: Icon(
                CupertinoIcons.graph_circle,
                color: Colors.black,
                size: 30,
              )),
          IconButton(
              onPressed: () {
                context.go("/profile");
              },
              icon: Icon(
                CupertinoIcons.person,
                color: Colors.black,
                size: 30,
              )),
        ],
      ),
    );
  }
}
