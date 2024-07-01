part of 'theme_manager.dart';

extension ColorHelper on BuildContext {
  Brightness get brightness => Theme.of(this).brightness;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get primary => colorScheme.primary;
  Color get onPrimary => colorScheme.onPrimary;
  Color get primaryContainer => colorScheme.primaryContainer;
  Color get onPrimaryContainer => colorScheme.onPrimaryContainer;

  Color get secondary => colorScheme.secondary;
  Color get onSecondary => colorScheme.onSecondary;
  Color get secondaryContainer => colorScheme.secondaryContainer;
  Color get onSecondaryContainer => colorScheme.onSecondaryContainer;

  Color get surface => colorScheme.surface;
  Color get onSurface => colorScheme.onSurface;
  Color get inverseSurface => colorScheme.inverseSurface;
  Color get onInverseSurface => colorScheme.onInverseSurface;

  Color get error => colorScheme.error;
  Color get errorContainer => colorScheme.errorContainer;
  Color get onError => colorScheme.onError;
  Color get onErrorContainer => colorScheme.onErrorContainer;

  Color get shadow => colorScheme.shadow;
}

extension TextStyleHelper on BuildContext {
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get titleLarge => Theme.of(this)
      .textTheme
      .titleLarge
      ?.copyWith(fontWeight: FontWeight.w500);
  TextStyle? get titleMedium => Theme.of(this)
      .textTheme
      .titleMedium
      ?.copyWith(fontWeight: FontWeight.w500);
  TextStyle? get titleSmall => Theme.of(this)
      .textTheme
      .titleSmall
      ?.copyWith(fontWeight: FontWeight.w500);

  TextStyle? get bodySmall =>
      Theme.of(this).textTheme.bodySmall?.copyWith(fontSize: 12);
  TextStyle? get bodyMedium =>
      Theme.of(this).textTheme.bodyMedium?.copyWith(fontSize: 14);
  TextStyle? get bodyLarge =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(fontSize: 16);

  TextStyle? get labelLarge => Theme.of(this)
      .textTheme
      .labelLarge
      ?.copyWith(fontSize: 16, fontWeight: FontWeight.w600);
  TextStyle? get labelMedium => Theme.of(this)
      .textTheme
      .labelMedium
      ?.copyWith(fontSize: 14, fontWeight: FontWeight.w600);
  TextStyle? get labelSmall => Theme.of(this)
      .textTheme
      .labelSmall
      ?.copyWith(fontSize: 12, fontWeight: FontWeight.w600);

  /// App Bar Title Style
  TextStyle? get appBarTitleStyle => titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
        color: onSurface,
      );
}

extension TextStyleColorMapping on TextStyle {
  TextStyle onPrimary(BuildContext context) {
    return copyWith(color: context.onPrimary);
  }

  TextStyle onSecondary(BuildContext context) {
    return copyWith(color: context.onSecondary);
  }

  TextStyle onPrimaryContainer(BuildContext context) {
    return copyWith(color: context.onPrimaryContainer);
  }

  TextStyle onSecondaryContainer(BuildContext context) {
    return copyWith(color: context.onSecondaryContainer);
  }

  TextStyle onSurface(BuildContext context) {
    return copyWith(color: context.onSurface);
  }
}
