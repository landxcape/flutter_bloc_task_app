part of 'use_dark_theme_bloc.dart';

abstract class UseDarkThemeEvent extends Equatable {
  const UseDarkThemeEvent();

  @override
  List<Object> get props => [];
}

class UseDarkThemeOnEvent extends UseDarkThemeEvent {}

class UseDarkThemeOffEvent extends UseDarkThemeEvent {}
