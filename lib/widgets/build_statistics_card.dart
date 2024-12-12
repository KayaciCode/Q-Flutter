import 'package:flutter/material.dart';

Widget _buildStatisticCard(String title,
    {required int solved, required int correct, required int incorrect}) {
  return Card(
    color: Colors.deepPurple[100],
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.deepPurple,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text("Çözülen Sorular: $solved"),
          Text("Doğru: $correct"),
          Text("Yanlış: $incorrect"),
        ],
      ),
    ),
  );
}
