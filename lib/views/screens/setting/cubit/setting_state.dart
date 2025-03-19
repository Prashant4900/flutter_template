part of 'setting_cubit.dart';

String getLanguageName(String locale) {
  switch (locale) {
    case 'es':
      return 'Español';
    case 'hi':
      return 'हिन्दी';
    default:
      return 'English';
  }
}

String getThemeSubtitle(ThemeMode themeMode, BuildContext context) {
  switch (themeMode) {
    case ThemeMode.system:
      return context.lang.systemDefault;
    case ThemeMode.light:
      return context.lang.light;
    case ThemeMode.dark:
      return context.lang.dark;
  }
}

class SettingState extends Equatable {
  const SettingState({
    required this.isDynamicColor,
    required this.locale,
    required this.themeMode,
    required this.isLoading,
    required this.dynamicColor,
    this.errorMessage,
  });

  factory SettingState.initial() {
    return SettingState(
      isDynamicColor: false,
      dynamicColor:
          AppPrefHelper.getDynamicColor() == 0
              ? colorPalette[0]
              : AppPrefHelper.getDynamicColor().toARGB32(),
      locale: 'en',
      themeMode: ThemeMode.system,
      isLoading: false,
    );
  }

  final bool isDynamicColor;
  final Color dynamicColor;
  final ThemeMode themeMode;
  final String locale;
  final bool isLoading;
  final String? errorMessage;

  SettingState copyWith({
    bool? isDynamicColor,
    String? locale,
    ThemeMode? themeMode,
    bool? isLoading,
    String? errorMessage,
    Color? dynamicColor,
  }) {
    return SettingState(
      isDynamicColor: isDynamicColor ?? this.isDynamicColor,
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      dynamicColor: dynamicColor ?? this.dynamicColor,
    );
  }

  @override
  List<Object?> get props => [
    isDynamicColor,
    locale,
    themeMode,
    isLoading,
    errorMessage,
    dynamicColor,
  ];
}
