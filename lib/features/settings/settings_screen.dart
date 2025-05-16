import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_projects_task/features/settings/cubit/settings_cubit.dart';
import 'package:x_projects_task/features/settings/cubit/settings_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final isDarkMode = state.theme.brightness == Brightness.dark;
          final isArabic = state.locale == "ar";
          final cubit = context.read<SettingsCubit>();

          return Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCard(
                  child: SwitchListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                    secondary: const Icon(Icons.dark_mode),
                    title: Text("Dark Mode", style: TextStyle(fontSize: 16.sp)),
                    value: isDarkMode,
                    onChanged: (value) => cubit.toggleTheme(),
                  ),
                ),
                SizedBox(height: 16.h),
                _buildCard(
                  child: ListTile(
                    leading: const Icon(Icons.language),
                    title: Text(
                      isArabic ? "Arabic" : "English",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    trailing: TextButton.icon(
                      onPressed: cubit.toggleLocale,
                      icon: const Icon(Icons.change_circle_outlined),
                      label: Text("Switch", style: TextStyle(fontSize: 16.sp)),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      elevation: 2,
      child: child,
    );
  }
}
