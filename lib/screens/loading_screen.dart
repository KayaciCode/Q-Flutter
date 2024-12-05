import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/core/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 230, 236),
      body: SizedBox.expand(
        // width: double.infinity,
        child: Column(
          children: [
            // Logo bölümü
            Expanded(
              child: Container(
                width: 250,
                height: 250,
                child: Image.asset(
                  'assets/images/logo.webp',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Yükleme ikonu

            const SizedBox(height: 20),

            // Yükleniyor yazısı
            // CircularProgressIndicator(),

            InkWell(
              onTap: () => context.go("/home"),
              child: SizedBox(
                width: 200,
                child:
                    DotLottieLoader.fromAsset("assets/motions/loadingg.lottie",
                        frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                  if (dotlottie != null) {
                    return Lottie.memory(dotlottie.animations.values.single);
                  } else {
                    return Container();
                  }
                }),
              ),
            ),

            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
