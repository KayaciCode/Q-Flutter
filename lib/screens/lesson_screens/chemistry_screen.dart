import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';
import 'package:go_router/go_router.dart';

class ChemistryScreen extends StatefulWidget {
  const ChemistryScreen({super.key});

  @override
  _ChemistryScreenState createState() => _ChemistryScreenState();
}

class _ChemistryScreenState extends State<ChemistryScreen> {
  final Map<String, bool> topics = {
    "Kimyasal Tepkimeler": false,
    "Asitler ve Bazlar": false,
    "Kimyasal Denge": false,
    "Redoks Tepkimeleri": false,
    "Periyodik Tablo": false,
    "Organik Kimya": false,
    "Fiziksel Kimya": false,
    "Elektrokimya": false,
    "Kimyasal Bağlar": false,
    "Maddenin Halleri": false,
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
        title: const Text("Kimya Konuları"),
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
      path: '/chemistry',
      builder: (context, state) => const ChemistryScreen(),
    ),
  ],
);
