part of 'theme_color_scheme_bloc.dart';

abstract class ThemeColorSchemeEvent extends Equatable {
  const ThemeColorSchemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeColorSchemeEvent extends ThemeColorSchemeEvent {
  final AppColorScheme colorScheme;
  const ChangeThemeColorSchemeEvent({
    required this.colorScheme,
  });
}
