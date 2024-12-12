import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';
import 'package:go_router/go_router.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  Map<String, Map<String, int>> statistics = {
    "Matematik": {"solved": 25, "correct": 20, "incorrect": 5},
    "Fizik": {"solved": 15, "correct": 12, "incorrect": 3},
    "Kimya": {"solved": 10, "correct": 9, "incorrect": 1},
    "Biyoloji": {"solved": 20, "correct": 18, "incorrect": 2},
  };

  void _editStatistics(String subject) {
    final solvedController = TextEditingController(
        text: statistics[subject]?["solved"].toString());
    final correctController = TextEditingController(
        text: statistics[subject]?["correct"].toString());
    final incorrectController = TextEditingController(
        text: statistics[subject]?["incorrect"].toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple[100],
          title: Text(
            "$subject İstatistiklerini Düzenle",
            style: const TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField("Çözülen Sorular", solvedController),
              const SizedBox(height: 10),
              _buildTextField("Doğru", correctController),
              const SizedBox(height: 10),
              _buildTextField("Yanlış", incorrectController),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("İptal", style: TextStyle(color: Colors.deepPurple)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: const Text("Kaydet"),
              onPressed: () {
                setState(() {
                  statistics[subject] = {
                    "solved": int.tryParse(solvedController.text) ?? 0,
                    "correct": int.tryParse(correctController.text) ?? 0,
                    "incorrect": int.tryParse(incorrectController.text) ?? 0,
                  };
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go("/home");
          },
          icon: const Icon(CupertinoIcons.return_icon),
        ),
        title: const Text('İstatistikler'),
        backgroundColor: arkaplanrenkim,
      ),
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ders İstatistikleri",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: statistics.entries.map((entry) {
                  final subject = entry.key;
                  final data = entry.value;
                  return Card(
                    color: Colors.deepPurple[100],
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        subject,
                        style: const TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text("Çözülen Sorular: ${data['solved']}"),
                          Text("Doğru: ${data['correct']}"),
                          Text("Yanlış: ${data['incorrect']}"),
                          const SizedBox(height: 8),
                          LinearProgressIndicator(
                            value: data['correct']! / (data['solved']! > 0
                                ? data['solved']!
                                : 1), // Doğru oranı
                            backgroundColor: Colors.deepPurple[200],
                            color: Colors.deepPurple,
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit, color: Colors.deepPurple),
                        onPressed: () => _editStatistics(subject),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
