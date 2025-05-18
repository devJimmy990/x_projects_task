import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_projects_task/core/helper/localization.dart';
import 'package:x_projects_task/features/settings/cubit/settings_cubit.dart';
import 'package:x_projects_task/features/settings/cubit/settings_state.dart';
import 'package:x_projects_task/features/settings/model/option_model.dart';
import 'package:x_projects_task/features/settings/settings_options_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final isDarkMode = state.theme.brightness == Brightness.dark;
          final cubit = context.read<SettingsCubit>();

          return Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SettingsOptionsCard(
                  title: Localization.selectTheme,
                  groupValue: isDarkMode ? "dark" : "light",
                  onChanged: (_) => cubit.toggleTheme(),
                  options: [
                    OptionModel(title: Localization.themeDark, value: "dark"),
                    OptionModel(title: Localization.themeLight, value: "light"),
                  ],
                ),
                SizedBox(height: 16.h),
                SettingsOptionsCard(
                  title: Localization.selectLanguage,
                  groupValue: state.locale,
                  onChanged: (_) => cubit.toggleLocale(),
                  options: [
                    OptionModel(
                      title: Localization.languageEnglish,
                      value: "en",
                    ),
                    OptionModel(
                      title: Localization.languageArabic,
                      value: "ar",
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
