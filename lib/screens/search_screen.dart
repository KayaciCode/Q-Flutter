import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:flutter_app/core/routes.dart';
import 'package:go_router/go_router.dart';

import '../widgets/bottom_menu.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: arkaplanrenkim,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go("/home");
            },
            icon: const Icon(CupertinoIcons.return_icon)),
        title: Text("Arama"),
        backgroundColor: arkaplanrenkim,
      ),
      body: Center(
        child: Text("arama ekranim"),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
