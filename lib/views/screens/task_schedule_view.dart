import 'package:flutter/material.dart';

class TaskScheduleView extends StatelessWidget {
  const TaskScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          const Text(
            'Task schedule',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          _buildDatePicker(),
          const SizedBox(height: 24),
          _buildCalendar(),
          const SizedBox(height: 24),
          _buildTaskCard(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage('https://hebbkx1anhila5yf.public.blob.vercel-storage.com/task%20management%20app-Pf6wT4g5axODlh03CRLNYTy7bYj0gr.webp'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFFF1F0F9),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.notifications_outlined),
        ),
      ],
    );
  }

  Widget _buildDatePicker() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.calendar_today, size: 20),
          const SizedBox(width: 8),
          const Text('27.07.2024'),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    return Column(
      children: [
        _buildWeekDays(),
        const SizedBox(height: 16),
        _buildCalendarGrid(),
      ],
    );
  }

  Widget _buildWeekDays() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
          .map((day) => SizedBox(
                width: 40,
                child: Text(
                  day,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildCalendarGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: 31,
      itemBuilder: (context, index) {
        return _buildCalendarDay(index + 1);
      },
    );
  }

  Widget _buildCalendarDay(int day) {
    Color backgroundColor = Colors.grey.shade200;
    if (day == 17 || day == 18) {
      backgroundColor = Colors.black;
    } else if (day == 25 || day == 26) {
      backgroundColor = const Color(0xFFB5B0EA);
    } else if (day >= 8 && day <= 10) {
      backgroundColor = const Color(0xFFCED86B);
    }

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$day',
          style: TextStyle(
            color: backgroundColor == Colors.black ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildTaskCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFCED86B),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'User flow admin panel',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Text('8 Review'),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.arrow_forward, size: 16),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.access_time, size: 16),
              const SizedBox(width: 4),
              const Text('10:00 AM - 06:30 PM'),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text('High Priority'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
