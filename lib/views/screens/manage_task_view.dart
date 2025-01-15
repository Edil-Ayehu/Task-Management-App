import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_textstyles.dart';

class ManageTaskView extends StatelessWidget {
  const ManageTaskView({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 24),
          Text(
            'Manage your task',
            style: AppTextStyle.h2,
          ),
          const SizedBox(height: 24),
          _buildProgressBars(context),
          const SizedBox(height: 24),
          _buildTimeFilter(context),
          const SizedBox(height: 24),
          Expanded(child: _buildBarChart(context)),
          _buildWeekDays(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
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
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.add, color: colorScheme.onPrimary),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.notifications_outlined, color: colorScheme.onSurface),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProgressBars(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Column(
      children: [
        _buildProgressBar(context, 'In progress', 3, colorScheme.secondary),
        const SizedBox(height: 8),
        _buildProgressBar(context, 'In review', 8, colorScheme.surface),
        const SizedBox(height: 16),
        _buildProgressBar(context, 'In progress', 6, colorScheme.primary),
        const SizedBox(height: 8),
        _buildProgressBar(context, 'In review', 1, colorScheme.tertiary),
      ],
    );
  }

  Widget _buildProgressBar(BuildContext context, String label, int count, Color color) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyle.withColor(AppTextStyle.bodyMedium, 
            color == colorScheme.primary ? colorScheme.onPrimary : colorScheme.onSurface)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text('$count', style: AppTextStyle.labelMedium),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeFilter(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Row(
      children: [
        Icon(Icons.calendar_today, size: 20, color: colorScheme.onBackground),
        const SizedBox(width: 16),
        _buildFilterChip(context, 'Day', false),
        const SizedBox(width: 8),
        _buildFilterChip(context, 'Week', true),
        const SizedBox(width: 8),
        _buildFilterChip(context, 'Month', false),
      ],
    );
  }

  Widget _buildFilterChip(BuildContext context, String label, bool isSelected) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? colorScheme.tertiary : colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: AppTextStyle.withColor(
          AppTextStyle.labelMedium,
          isSelected ? colorScheme.onTertiary : colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildBarChart(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(
        7,
        (index) => _buildBar(context),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 30,
          height: 60,
          color: colorScheme.tertiary,
        ),
        Container(
          width: 30,
          height: 40,
          color: colorScheme.secondary,
        ),
        Container(
          width: 30,
          height: 80,
          color: colorScheme.primary,
        ),
      ],
    );
  }

  Widget _buildWeekDays(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
          .map((day) => Text(day, style: const TextStyle(fontSize: 16)))
          .toList(),
    );
  }
}