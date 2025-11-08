import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/exams_description_screen.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  const ExamCard({Key? key, required this.exam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPast = exam.dateTime.isBefore(DateTime.now());

    return Card(
      color: isPast ? Colors.grey[100] : const Color.fromARGB(255, 246, 206, 103),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Icon(Icons.book, color: isPast ? Colors.grey : const Color.fromARGB(255, 255, 255, 255)),
        title: Text(
          exam.subject,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isPast ? Colors.black54 : Colors.black87,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 4),
                Text(
                    '${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year} - '
                    '${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}'),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.room, size: 16),
                const SizedBox(width: 4),
                Text(exam.rooms.join(', ')),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ExamsDetailScreen(exam: exam),
            ),
          );
        },
      ),
    );
  }
}
