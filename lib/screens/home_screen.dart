import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:flutter_app/widgets/alarm_dialog.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';
import 'package:flutter_app/widgets/screen_state.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key, required Null Function(dynamic isDark) onThemeChanged});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer _timer;
  late Duration _remainingTime;

  @override
  void initState() {
    super.initState();
    _initializeCountdown();
  }

  void _initializeCountdown() {
    final DateTime targetDate = DateTime(2025, 6, 1); // YKS tarihi
    final Duration difference = targetDate.difference(DateTime.now());

    setState(() {
      _remainingTime = difference;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime = _remainingTime - const Duration(seconds: 1);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _showAlarmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlarmDialog(); // AlarmDialog ekranını doğru şekilde ekliyoruz.
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: _buildAppBar(context),
      drawer: _buildDrawer(context),
      body: SafeArea(
        // SafeArea ile ekran kenarlarına yaklaşım engellendi
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Geri sayım kutusu
              _buildCountdownBox(),
              const SizedBox(height: 20),
              const Expanded(
                  child: ScreenState()), // ScreenState widget'ı genişlik alır
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
      floatingActionButton: _buildFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('StudyHub'),
      backgroundColor: arkaplanrenkim,
      actions: [
        IconButton(
          icon: const Icon(CupertinoIcons.search,
              color: Colors.black87, size: 30),
          onPressed: () => context.go("/search"),
        ),
      ],
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 0,
      child: Column(
        children: [
          _buildDrawerHeader(context),
          _buildDrawerListTiles(context),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => context.go("/profile"),
            child: const CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/images/profile_image.jpg'),
            ),
          ),
          const SizedBox(height: 10),
          const Text('KayaciCode',
              style: TextStyle(color: Colors.black, fontSize: 18)),
        ],
      ),
    );
  }

  Widget _buildDrawerListTiles(BuildContext context) {
    return Column(
      children: [
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
          onTap: () => context.go("/settings"),
        ),
        ListTile(
          leading: const Icon(CupertinoIcons.arrow_right_circle),
          title: const Text('Çıkış Yap'),
          onTap: () => context.go("/login"),
        ),
      ],
    );
  }

  Widget _buildCountdownBox() {
    final int days = _remainingTime.inDays;
    final int hours = _remainingTime.inHours % 24;
    final int minutes = _remainingTime.inMinutes % 60;
    final int seconds = _remainingTime.inSeconds % 60;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "YKS'ye Kalan Süre",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTimeBox(days, 'Gün'),
              const SizedBox(width: 8),
              _buildTimeBox(hours, 'Saat'),
              const SizedBox(width: 8),
              _buildTimeBox(minutes, 'Dakika'),
              const SizedBox(width: 8),
              _buildTimeBox(seconds, 'Saniye'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeBox(int value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            '$value',
            style: const TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showAlarmDialog(context),
      backgroundColor: Colors.white,
      child:
          const Icon(CupertinoIcons.alarm, color: Colors.deepPurple, size: 30),
    );
  }
}
