import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamsDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamsDetailScreen({Key? key, required this.exam}) : super(key: key);

  String _timeUntilExam() {
    final now = DateTime.now();
    if (exam.dateTime.isBefore(now)) return "Испитот е завршен";

    final diff = exam.dateTime.difference(now);
    final days = diff.inDays;
    final hours = diff.inHours % 24;
    return "$days дена, $hours часа";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exam.subject)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Предмет: ${exam.subject}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.calendar_today),
                    const SizedBox(width: 8),
                    Text(
                        'Датум: ${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year} ${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}'),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.room),
                    const SizedBox(width: 8),
                    Text('Простории: ${exam.rooms.join(', ')}'),
                  ],
                ),
                const SizedBox(height: 20),
                Text('Преостанато време: ${_timeUntilExam()}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.orangeAccent)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
