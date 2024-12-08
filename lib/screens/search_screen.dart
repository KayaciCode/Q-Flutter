import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';

import '../widgets/bottom_menu.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: arkaplanrenkim,
      body: Center(
        child: Text("arama ekranim"),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
