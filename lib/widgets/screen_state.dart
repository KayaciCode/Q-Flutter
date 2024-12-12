import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';

class ScreenState extends StatefulWidget {
  const ScreenState({super.key});

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<ScreenState> {
  List<String> _taskNames = [];
  List<bool> _tasks = [];
  final TextEditingController _taskController = TextEditingController();

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        _taskNames.add(_taskController.text);
        _tasks.add(false);
      });
      _taskController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Günlük Hedefler",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: "Yeni Hedef",
                hintText: "Hedefinizi girin",
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white60),
                filled: true,
                fillColor: Colors.white24,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addTask,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple.shade700,
              ),
              child: const Text(
                "Hedef Ekle",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _taskNames.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(
                      _taskNames[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                    value: _tasks[index],
                    onChanged: (bool? value) {
                      setState(() {
                        _tasks[index] = value!;
                      });
                    },
                    activeColor: Colors.deepPurple,
                    checkColor: Colors.green,
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
