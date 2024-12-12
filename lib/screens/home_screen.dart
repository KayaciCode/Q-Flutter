import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:flutter_app/widgets/alarm_dialog.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';
import 'package:go_router/go_router.dart';
import '../widgets/screen_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showAlarmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlarmDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Text('StudyHub'),
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
      drawer: Drawer(
        backgroundColor: Colors.white,
        elevation: 0,
        child: Column(
          children: [
            Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
      body: const ScreenState(), // Burada HomeScreenState'i kullanıyorsunuz
      bottomNavigationBar: BottomMenu(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAlarmDialog(context),
        backgroundColor: Colors.white,
        child: const Icon(
          CupertinoIcons.alarm,
          color: Colors.deepPurple,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
