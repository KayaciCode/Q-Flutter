import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';
import 'package:go_router/go_router.dart';

class PhysicsScreen extends StatefulWidget {
  const PhysicsScreen({super.key});

  @override
  _PhysicsScreenState createState() => _PhysicsScreenState();
}

class _PhysicsScreenState extends State<PhysicsScreen> {
  final Map<String, bool> topics = {
    "Kinematik": false,
    "Dinamık": false,
    "Enerji ve Kuvvet": false,
    "Elektrik ve Manyetizma": false,
    "Optik": false,
    "Termodinamik": false,
    "Dalga ve Ses": false,
    "Nükleer Fizik": false,
    "Modern Fizik": false,
    "Elektron ve Işık": false,
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
        title: const Text("Fizik Konuları"),
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
                color: Colors.white, // Beyaz renk ekledim
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
      path: '/physics',
      builder: (context, state) => const PhysicsScreen(),
    ),
  ],
);
