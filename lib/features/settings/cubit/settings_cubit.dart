import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:x_projects_task/core/theme/app_theme.dart';
import 'package:x_projects_task/features/settings/cubit/settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit()
    : super(SettingsInitial(locale: "en", theme: AppThemeData.light));

  void toggleLocale() => emit(
    state.locale == "en"
        ? SettingsInitial(locale: "ar", theme: state.theme)
        : SettingsInitial(locale: "en", theme: state.theme),
  );

  void toggleTheme() => emit(
    state.theme == AppThemeData.light
        ? SettingsInitial(locale: state.locale, theme: AppThemeData.dark)
        : SettingsInitial(locale: state.locale, theme: AppThemeData.light),
  );

  bool get isEnglish => state.locale == "en";
  bool get isDark => state.theme == AppThemeData.dark;

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    final isDark = json['isDark'] as bool;
    final theme = isDark ? AppThemeData.dark : AppThemeData.light;
    return SettingsInitial(locale: json['locale'], theme: theme);
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return {'locale': state.locale, 'isDark': state.theme == AppThemeData.dark};
  }
}
