import 'package:flutter/material.dart';

class ManageTaskView extends StatelessWidget {
  const ManageTaskView({Key? key}) : super(key: key);

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
            'Manage your task',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          _buildProgressBars(),
          const SizedBox(height: 24),
          _buildTimeFilter(),
          const SizedBox(height: 24),
          Expanded(child: _buildBarChart()),
          _buildWeekDays(),
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
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xFFF1F0F9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.notifications_outlined),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProgressBars() {
    return Column(
      children: [
        _buildProgressBar(
          'In progress',
          3,
          const Color(0xFFB5B0EA),
        ),
        const SizedBox(height: 8),
        _buildProgressBar(
          'In review',
          8,
          Colors.grey.shade200,
        ),
        const SizedBox(height: 16),
        _buildProgressBar(
          'In progress',
          6,
          Colors.black,
        ),
        const SizedBox(height: 8),
        _buildProgressBar(
          'In review',
          1,
          const Color(0xFFCED86B),
        ),
      ],
    );
  }

  Widget _buildProgressBar(String label, int count, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text('$count'),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeFilter() {
    return Row(
      children: [
        const Icon(Icons.calendar_today, size: 20),
        const SizedBox(width: 16),
        _buildFilterChip('Day', false),
        const SizedBox(width: 8),
        _buildFilterChip('Week', true),
        const SizedBox(width: 8),
        _buildFilterChip('Month', false),
      ],
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFCED86B) : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label),
    );
  }

  Widget _buildBarChart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(
        7,
        (index) => _buildBar(),
      ),
    );
  }

  Widget _buildBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 30,
          height: 60,
          color: const Color(0xFFCED86B),
        ),
        Container(
          width: 30,
          height: 40,
          color: const Color(0xFFB5B0EA),
        ),
        Container(
          width: 30,
          height: 80,
          color: Colors.black,
        ),
      ],
    );
  }

  Widget _buildWeekDays() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
          .map((day) => Text(day, style: const TextStyle(fontSize: 16)))
          .toList(),
    );
  }
}