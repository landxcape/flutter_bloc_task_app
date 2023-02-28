part of 'theme_color_scheme_bloc.dart';

class ThemeColorSchemeState extends Equatable {
  final AppColorScheme colorScheme;
  const ThemeColorSchemeState({
    required this.colorScheme,
  });

  @override
  List<Object> get props => [];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'colorScheme': colorScheme.scheme.value,
    };
  }

  factory ThemeColorSchemeState.fromMap(Map<String, dynamic> map) {
    return ThemeColorSchemeState(
      colorScheme: AppColorScheme.values.firstWhere((colorScheme) => colorScheme.scheme.value == map['colorScheme'] as int),
    );
  }
}

class ThemeColorSchemeInitial extends ThemeColorSchemeState {
  const ThemeColorSchemeInitial({
    super.colorScheme = AppColorScheme.teal,
  });
}
