sealed class SettingsState {
  final String locale, theme;
  const SettingsState({required this.locale, required this.theme});
}

class SettingsInitial extends SettingsState {
  const SettingsInitial({required super.locale, required super.theme});
}
