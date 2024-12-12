import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmDialog extends StatelessWidget {
  const AlarmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[100],
      title: const Text(
        "Alarm Kur",
        style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Saat",
              hintText: "HH:MM",
              prefixIcon: Icon(CupertinoIcons.time, color: Colors.deepPurple),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            keyboardType: TextInputType.datetime,
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: "Alarm Mesajı",
              prefixIcon:
                  Icon(CupertinoIcons.chat_bubble, color: Colors.deepPurple),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child:
              const Text("İptal", style: TextStyle(color: Colors.deepPurple)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
          ),
          child: const Text("Kur"),
          onPressed: () {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Alarm kuruldu!"),
                backgroundColor: Colors.deepPurple,
              ),
            );
          },
        ),
      ],
    );
  }
}

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
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showAlarmDialog(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
          ),
          child: const Text(
            "Alarm Kur",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Alt Menü",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
