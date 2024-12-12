import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LessonCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const LessonCard({
    required this.title,
    required this.description,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: const Icon(CupertinoIcons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
