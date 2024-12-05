import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 230, 236),

      // AppBar
      appBar: AppBar(
        title: const Text('Dersler'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.book),
            onPressed: () {},
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
                children: const [
                  Icon(
                    CupertinoIcons.person_circle,
                    size: 80,
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Kullanıcı Adı',
                    style: TextStyle(
                      color: Colors.white,
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
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.book),
              title: const Text('Dersler'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.paperclip),
              title: const Text('Son Ödevler'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.chart_bar_square),
              title: const Text('İstatikler'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Ayarlar'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
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
      bottomNavigationBar: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.home)),
            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.book)),
            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search)),
            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.person)),
          ],
        ),
      ),
    );
  }
}
