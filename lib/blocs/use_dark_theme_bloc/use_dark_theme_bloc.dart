import 'package:equatable/equatable.dart';

import '../bloc_exports.dart';

part 'use_dark_theme_event.dart';
part 'use_dark_theme_state.dart';

class UseDarkThemeBloc extends HydratedBloc<UseDarkThemeEvent, UseDarkThemeState> {
  UseDarkThemeBloc() : super(const UseDarkThemeInitial()) {
    on<UseDarkThemeOnEvent>((event, emit) {
      emit(const UseDarkThemeState(useDarkTheme: true));
    });
    on<UseDarkThemeOffEvent>((event, emit) {
      emit(const UseDarkThemeState(useDarkTheme: false));
    });
  }

  @override
  UseDarkThemeState? fromJson(Map<String, dynamic> json) {
    return UseDarkThemeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(UseDarkThemeState state) {
    return state.toMap();
  }
}
