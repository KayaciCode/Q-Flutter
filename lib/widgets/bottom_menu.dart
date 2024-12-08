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
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.home,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                context.go("/lesson");
              },
              icon: Icon(
                CupertinoIcons.book,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                context.go("/search");
              },
              icon: Icon(
                CupertinoIcons.search,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                context.go("/profile");
              },
              icon: Icon(
                CupertinoIcons.person,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}
