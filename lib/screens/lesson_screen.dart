import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:flutter_app/core/routes.dart';
import 'package:go_router/go_router.dart';

import '../widgets/bottom_menu.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go("/home");
            },
            icon: const Icon(CupertinoIcons.return_icon)),
        backgroundColor: arkaplanrenkim,
        title: const Text('Derslerim'),
      ),
      backgroundColor: arkaplanrenkim,
      body: Center(
        child: Text("Derslerim"),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
