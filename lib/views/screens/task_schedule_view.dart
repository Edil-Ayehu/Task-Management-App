import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_textstyles.dart';

class TaskScheduleView extends StatelessWidget {
  const TaskScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 24),
          Text(
            'Task schedule',
            style: AppTextStyle.h2,
          ),
          const SizedBox(height: 24),
          _buildDatePicker(context),
          const SizedBox(height: 24),
          _buildCalendar(context),
          const SizedBox(height: 24),
          _buildTaskCard(context),
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
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(Icons.notifications_outlined, color: colorScheme.onSurface),
        ),
      ],
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.calendar_today, size: 20, color: colorScheme.onSurface),
          const SizedBox(width: 8),
          Text('27.07.2024', style: AppTextStyle.withColor(AppTextStyle.bodyMedium, colorScheme.onSurface)),
          Icon(Icons.arrow_drop_down, color: colorScheme.onSurface),
        ],
      ),
    );
  }

  Widget _buildCalendar(BuildContext context) {
    return Column(
      children: [
        _buildWeekDays(context),
        const SizedBox(height: 16),
        _buildCalendarGrid(context),
      ],
    );
  }

  Widget _buildWeekDays(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
          .map((day) => SizedBox(
                width: 40,
                child: Text(
                  day,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.withColor(
                    AppTextStyle.withWeight(AppTextStyle.bodyMedium, FontWeight.bold),
                    colorScheme.onBackground,
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildCalendarGrid(BuildContext context) {
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
        return _buildCalendarDay(context, index + 1);
      },
    );
  }

  Widget _buildCalendarDay(BuildContext context, int day) {
    final colorScheme = Theme.of(context).colorScheme;
    
    Color backgroundColor = colorScheme.surface;
    if (day == 17 || day == 18) {
      backgroundColor = colorScheme.primary;
    } else if (day == 25 || day == 26) {
      backgroundColor = colorScheme.secondary;
    } else if (day >= 8 && day <= 10) {
      backgroundColor = colorScheme.tertiary;
    }

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$day',
          style: AppTextStyle.withColor(
            AppTextStyle.bodySmall,
            backgroundColor == colorScheme.primary ? colorScheme.onPrimary : colorScheme.onSurface,
          ),
        ),
      ),
    );
  }

  Widget _buildTaskCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.tertiary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'User flow admin panel',
                style: AppTextStyle.withColor(AppTextStyle.buttonLarge, colorScheme.onTertiary),
              ),
              Row(
                children: [
                  Text('8 Review', style: AppTextStyle.withColor(AppTextStyle.bodyMedium, colorScheme.onTertiary)),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.arrow_forward, size: 16, color: colorScheme.onSurface),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.access_time, size: 16, color: colorScheme.onTertiary),
              const SizedBox(width: 4),
              Text(
                '10:00 AM - 06:30 PM',
                style: AppTextStyle.withColor(AppTextStyle.bodyMedium, colorScheme.onTertiary),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'High Priority',
                  style: AppTextStyle.withColor(AppTextStyle.labelMedium, colorScheme.onSurface),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
