import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_textstyles.dart';

class ManageTaskView extends StatelessWidget {
  const ManageTaskView({super.key});
  

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            SizedBox(height: size.height * 0.03),
            _buildTaskHeader(context),
            SizedBox(height: size.height * 0.02),
            _buildProgressBars(context),
            SizedBox(height: size.height * 0.03),
            _buildTimeFilter(context),
            SizedBox(height: size.height * 0.02),
            SizedBox(
              height: size.height * 0.3,
              child: _buildBarChart(context),
            ),
            _buildWeekDays(context),
          ],
        ),
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
          backgroundImage: NetworkImage(
              'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/task%20management%20app-Pf6wT4g5axODlh03CRLNYTy7bYj0gr.webp'),
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
              child: Icon(Icons.notifications_outlined,
                  color: colorScheme.onSurface),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTaskHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(size.width * 0.05),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primary.withOpacity(0.1),
            colorScheme.primary.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Manage your task',
                      style: AppTextStyle.withColor(
                        AppTextStyle.h2,
                        colorScheme.primary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      'Track and organize your tasks efficiently',
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodySmall,
                        colorScheme.onBackground.withOpacity(0.7),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(width: size.width * 0.04),
              Container(
                padding: EdgeInsets.all(size.width * 0.03),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.task_alt,
                  color: colorScheme.primary,
                  size: size.width * 0.06,
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.02),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildTaskStat(
                    context, 'Total Tasks', '18', Icons.assignment_outlined),
                SizedBox(width: size.width * 0.03),
                _buildTaskStat(
                    context, 'Completed', '12', Icons.check_circle_outline),
                SizedBox(width: size.width * 0.03),
                _buildTaskStat(context, 'Pending', '6', Icons.pending_outlined),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskStat(
    BuildContext context,
    String label,
    String count,
    IconData icon,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: colorScheme.primary,
            size: 20,
          ),
          const SizedBox(height: 8),
          Text(
            count,
            style: AppTextStyle.withColor(
              AppTextStyle.h3,
              colorScheme.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyle.withColor(
              AppTextStyle.bodySmall,
              colorScheme.onBackground.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBars(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(size.width * 0.04),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Task Progress',
            style: AppTextStyle.withColor(
              AppTextStyle.h3,
              colorScheme.onSurface,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          _buildProgressBar(
            context, 
            'In Progress', 
            3, 
            8, 
            colorScheme.primary,
          ),
          SizedBox(height: size.height * 0.02),
          _buildProgressBar(
            context, 
            'In Review', 
            8, 
            12, 
            colorScheme.tertiary,
          ),
          SizedBox(height: size.height * 0.02),
          _buildProgressBar(
            context, 
            'Completed', 
            6, 
            10, 
            colorScheme.secondary,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar(
    BuildContext context,
    String label,
    int current,
    int total,
    Color color,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final progress = current / total;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppTextStyle.withColor(
                AppTextStyle.bodyMedium,
                colorScheme.onSurface,
              ),
            ),
            Text(
              '$current/$total',
              style: AppTextStyle.withColor(
                AppTextStyle.labelMedium,
                colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            // Background bar
            Container(
              height: 8,
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            // Progress bar
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 8,
              width: MediaQuery.of(context).size.width * 0.8 * progress,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeFilter(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Icon(Icons.calendar_today,
              size: size.width * 0.05, color: colorScheme.onBackground),
          SizedBox(width: size.width * 0.04),
          _buildFilterChip(context, 'Day', false),
          SizedBox(width: size.width * 0.02),
          _buildFilterChip(context, 'Week', true),
          SizedBox(width: size.width * 0.02),
          _buildFilterChip(context, 'Month', false),
        ],
      ),
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
    final size = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraints) {
        final barWidth = (constraints.maxWidth - (6 * size.width * 0.02)) / 7;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(
            7,
            (index) => _buildBar(context, barWidth),
          ),
        );
      },
    );
  }

  Widget _buildBar(BuildContext context, double width) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: width,
          height: size.height * 0.08,
          decoration: BoxDecoration(
            color: colorScheme.tertiary,
            borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
          ),
        ),
        Container(
          width: width,
          height: size.height * 0.05,
          color: colorScheme.secondary,
        ),
        Container(
          width: width,
          height: size.height * 0.1,
          decoration: BoxDecoration(
            color: colorScheme.primary,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
          ),
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
