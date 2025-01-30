import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:flutter_app/core/routes.dart';
import 'package:flutter_app/widgets/lesson_card.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/bottom_menu.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Derslerim",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  LessonCard(
                    title: "Matematik",
                    description: "Fonksiyonlar, Türev ve İntegral",
                    onTap: () => context.go("/math"),
                  ),
                  LessonCard(
                    title: "Fizik",
                    description: "Kuvvet ve Hareket, Elektrik",
                    onTap: () => context.go("/physics"),
                  ),
                  LessonCard(
                    title: "Kimya",
                    description: "Moleküler Yapı, Organik Kimya",
                    onTap: () => context.go("/chemistry"),
                  ),
                  LessonCard(
                    title: "Biyoloji",
                    description: "Hücre, Genetik ve Evrim",
                    onTap: () => context.go("/biology"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
