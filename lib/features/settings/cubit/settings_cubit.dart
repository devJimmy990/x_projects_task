import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:x_projects_task/core/theme/app_theme.dart';
import 'package:x_projects_task/features/settings/cubit/settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit()
    : super(const SettingsInitial(locale: "system", theme: "system"));

  void changeLocale(String locale) {
    emit(SettingsInitial(locale: locale, theme: state.theme));
  }

  void changeTheme(String theme) {
    emit(SettingsInitial(locale: state.locale, theme: theme));
  }

  bool get isDark => themeModeResolved().brightness == Brightness.dark;

  bool get isEnglish => state.locale == "en";

  ThemeData themeModeResolved() {
    return switch (state.theme) {
      "dark" => AppThemeData.dark,
      "light" => AppThemeData.light,
      _ =>
        WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                Brightness.dark
            ? AppThemeData.dark
            : AppThemeData.light,
    };
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsInitial(
      locale: json['locale'] ?? "system",
      theme: json['theme'] ?? "system",
    );
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return {'locale': state.locale, 'theme': state.theme};
  }
}
