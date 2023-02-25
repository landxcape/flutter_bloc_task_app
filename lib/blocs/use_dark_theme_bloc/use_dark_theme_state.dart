part of 'use_dark_theme_bloc.dart';

class UseDarkThemeState extends Equatable {
  final bool useDarkTheme;
  const UseDarkThemeState({required this.useDarkTheme});

  @override
  List<Object> get props => [useDarkTheme];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'useDarkTheme': useDarkTheme,
    };
  }

  factory UseDarkThemeState.fromMap(Map<String, dynamic> map) {
    return UseDarkThemeState(
      useDarkTheme: map['useDarkTheme'] as bool,
    );
  }
}

class UseDarkThemeInitial extends UseDarkThemeState {
  const UseDarkThemeInitial({super.useDarkTheme = false});
}
