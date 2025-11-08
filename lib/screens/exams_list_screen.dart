import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/ExamCard.dart';

class ExamsListScreen extends StatelessWidget {
  final List<Exam> exams =[
    Exam(subject: 'Калкулус 2', dateTime: DateTime(2025, 12, 12, 9, 0), rooms: ['Барака 3.2', 'Барака 3.1']),
    Exam(subject: 'Алгоритми и податочни структури', dateTime: DateTime(2025, 6, 13, 10, 0), rooms: ['Lab 13']),
    Exam(subject: 'Информациска безбедност', dateTime: DateTime(2025, 11, 28, 12, 0), rooms: ['Lab 215']),
    Exam(subject: 'Оперативни системи', dateTime: DateTime(2026, 02, 15, 8, 0), rooms: ['Lab 13']),
    Exam(subject: 'Компјутерски мрежи', dateTime: DateTime(2025, 1, 14, 9, 0), rooms: ['Lab 215']),
    Exam(subject: 'Вештачка интелигенција', dateTime: DateTime(2025, 1, 20, 11, 0), rooms: ['Lab 117']),
    Exam(subject: 'Програмски јазици', dateTime: DateTime(2024, 12, 28, 8, 30), rooms: ['Lab 200В']),
    Exam(subject: 'Интернет технологии', dateTime: DateTime(2025, 1, 25, 10, 0), rooms: ['Lab 233']),
    Exam(subject: 'Програмирање на видео игри', dateTime: DateTime(2026, 1, 1, 11, 0), rooms: ['Lab 13']),
    Exam(subject: 'Дизајн на дигитални кола', dateTime: DateTime(2025, 1, 30, 9, 0), rooms: ['Lab 138']),
    Exam(subject: 'Процесирање на сигналите', dateTime: DateTime(2024, 12, 12, 9, 0), rooms: ['Барака 2.1', 'Барака 2.2']),
  ];

  ExamsListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 215018'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) => ExamCard(exam: exams[index]),
            ),
          ),
          Container(
            color: Colors.orangeAccent,
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            child: Text(
              'Вкупно испити: ${exams.length}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
