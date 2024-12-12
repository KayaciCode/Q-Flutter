import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:flutter_app/core/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../widgets/bottom_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,

      // AppBar
      appBar: AppBar(
        title: const Text(
          'StudyHub',
          selectionColor: Colors.black87,
        ),
        backgroundColor: arkaplanrenkim,
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.search,
              color: Colors.black87,
              size: 30,
            ),
            onPressed: () {
              context.go("/search");
            },
          ),
        ],
      ),

      // Drawer (Yan Menü)
      drawer: Drawer(
        backgroundColor: Colors.white,
        elevation: 0,
        child: Column(
          children: [
            // Drawer Header
            Container(
              height: 200,
              // color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Replace Imagea with a proper profile picture widget
                  InkWell(
                    onTap: () => context.go("/profile"),
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage:
                          AssetImage('assets/images/profile_image.jpg'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'KayaciCode',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            // Menü öğeleri
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Ana Sayfa'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.book),
              title: const Text('Derslerim'),
              onTap: () => context.go("/lesson"),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.graph_circle),
              title: const Text('İstatistikler'),
              onTap: () => context.go("/statistics"),
            ),
            ListTile(
                leading: const Icon(CupertinoIcons.settings),
                title: const Text('Ayarlar'),
                onTap: () => context.go("/settings")),
            ListTile(
                leading: const Icon(CupertinoIcons.arrow_right_circle),
                title: const Text('Çıkış Yap'),
                onTap: () => context.go("/login")),
          ],
        ),
      ),

      // Ana içerik
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animasyon
            SizedBox(
              width: 200,
              child: DotLottieLoader.fromAsset("assets/motions/learn.lottie",
                  frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                if (dotlottie != null) {
                  return Lottie.memory(dotlottie.animations.values.single);
                } else {
                  return CircularProgressIndicator();
                }
              }),
            ),
          ],
        ),
      ),

      // Alt navigasyon çubuğu
      bottomNavigationBar: BottomMenu(),
    );
  }
}
