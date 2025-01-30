import 'package:flutter/material.dart';
import 'package:flutter_app/screens/lesson_screens/Physics_screen.dart';
import 'package:flutter_app/screens/lesson_screens/chemistry_screen.dart';
import 'package:flutter_app/screens/lesson_screens/biology_screens.dart';
import 'package:flutter_app/screens/lesson_screens/math_screen.dart';
import 'package:flutter_app/screens/search_screen.dart';
import 'package:flutter_app/screens/lesson_screens/lesson_screen.dart';
import 'package:flutter_app/screens/settings_screen.dart';
import 'package:flutter_app/screens/statistics_screen.dart';
import 'package:go_router/go_router.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(onThemeChanged: (newTheme) {}),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/lesson',
      builder: (context, state) => const LessonScreen(),
    ),
    GoRoute(
      path: '/statistics',
      builder: (context, state) => const StatisticsScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/biology',
      builder: (context, state) => const BiologyScreen(),
    ),
    GoRoute(
      path: '/math',
      builder: (context, state) => const MathScreen(),
    ),
    GoRoute(
      path: '/chemistry',
      builder: (context, state) => const ChemistryScreen(),
    ),
    GoRoute(
      path: '/physics',
      builder: (context, state) => const PhysicsScreen(),
    ),
  ],
);
