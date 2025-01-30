import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';
import 'package:go_router/go_router.dart';

class BiologyScreen extends StatefulWidget {
  const BiologyScreen({super.key});

  @override
  _BiologyScreenState createState() => _BiologyScreenState();
}

class _BiologyScreenState extends State<BiologyScreen> {
  final Map<String, bool> topics = {
    "Hücre": false,
    "Hücre Bölünmeleri": false,
    "Genetik": false,
    "Ekosistem": false,
    "Canlıların Sınıflandırılması": false,
    "Solunum Sistemi": false,
    "Sindirim Sistemi": false,
    "Boşaltım Sistemi": false,
    "Üreme Sistemi": false,
    "Dolaşım Sistemi": false,
    "Sinir Sistemi": false,
    "Bitki Biyolojisi": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go("/lesson"),
          icon: const Icon(CupertinoIcons.return_icon),
        ),
        backgroundColor: arkaplanrenkim,
        title: const Text("Biyoloji Konuları"),
      ),
      backgroundColor: arkaplanrenkim,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: topics.keys.map((topic) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white, // Beyaz renk kutular için
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2), // Kutuların gölgesi
                  ),
                ],
              ),
              child: CheckboxListTile(
                title: Text(topic, style: const TextStyle(color: Colors.black)),
                value: topics[topic],
                onChanged: (bool? value) {
                  setState(() {
                    topics[topic] = value ?? false;
                  });
                },
                activeColor: Colors.green,
                checkColor: Colors.white,
              ),
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/biology',
      builder: (context, state) => const BiologyScreen(),
    ),
  ],
);
