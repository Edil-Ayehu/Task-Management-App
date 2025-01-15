import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/theme_controller.dart';
import 'package:todo_app/core/utils/app_textstyles.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            SizedBox(height: size.height * 0.03),
            _buildSettingsSection(
              context,
              'Appearance',
              [
                _buildThemeToggle(context),
                _buildSettingsTile(
                  context,
                  'Language',
                  'English',
                  Icons.language,
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            _buildSettingsSection(
              context,
              'Notifications',
              [
                _buildSettingsTile(
                  context,
                  'Push Notifications',
                  'Enabled',
                  Icons.notifications_outlined,
                  onTap: () {},
                ),
                _buildSettingsTile(
                  context,
                  'Email Notifications',
                  'Daily Digest',
                  Icons.mail_outline,
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            _buildSettingsSection(
              context,
              'Account',
              [
                _buildSettingsTile(
                  context,
                  'Profile',
                  'John Doe',
                  Icons.person_outline,
                  onTap: () {},
                ),
                _buildSettingsTile(
                  context,
                  'Security',
                  'Fingerprint, Face ID',
                  Icons.security,
                  onTap: () {},
                ),
                _buildSettingsTile(
                  context,
                  'Data & Storage',
                  '1.2 GB used',
                  Icons.storage_outlined,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Text(
          'Settings',
          style: AppTextStyle.withColor(
            AppTextStyle.h1,
            colorScheme.primary,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.settings,
            color: colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            colorScheme.onBackground,
          ),
        ),
        const SizedBox(height: 12),
        Container(
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
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildThemeToggle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Consumer<ThemeController>(
      builder: (context, themeController, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  themeController.isDarkMode
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dark Mode',
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyLarge,
                        colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      themeController.isDarkMode ? 'On' : 'Off',
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodySmall,
                        colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Switch.adaptive(
                value: themeController.isDarkMode,
                onChanged: (_) => themeController.toggleTheme(),
                activeColor: colorScheme.primary,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSettingsTile(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon, {
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: colorScheme.primary),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.withColor(
                      AppTextStyle.bodyLarge,
                      colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: AppTextStyle.withColor(
                      AppTextStyle.bodySmall,
                      colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: colorScheme.onSurface.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}
