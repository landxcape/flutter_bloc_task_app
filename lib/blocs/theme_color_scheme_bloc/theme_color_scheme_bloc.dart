import 'package:equatable/equatable.dart';
import 'package:flutter_tasks_app/resources/app_color_scheme_enum.dart';

import '../bloc_exports.dart';

part 'theme_color_scheme_event.dart';
part 'theme_color_scheme_state.dart';

class ThemeColorSchemeBloc extends HydratedBloc<ThemeColorSchemeEvent, ThemeColorSchemeState> {
  ThemeColorSchemeBloc() : super(const ThemeColorSchemeInitial()) {
    on<ChangeThemeColorSchemeEvent>((event, emit) {
      emit(ThemeColorSchemeState(colorScheme: event.colorScheme));
    });
  }

  @override
  ThemeColorSchemeState? fromJson(Map<String, dynamic> json) {
    return ThemeColorSchemeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeColorSchemeState state) {
    return state.toMap();
  }
}
