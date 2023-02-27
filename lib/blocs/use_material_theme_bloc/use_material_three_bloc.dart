import 'package:equatable/equatable.dart';

import '../bloc_exports.dart';

part 'use_material_three_event.dart';
part 'use_material_three_state.dart';

class UseMaterialThreeBloc extends HydratedBloc<UseMaterialThreeEvent, UseMaterialThreeState> {
  UseMaterialThreeBloc() : super(const UseMaterialThreeInitial()) {
    on<UseMaterialThreeTrueEvent>((event, emit) {
      emit(const UseMaterialThreeState(useMaterialThree: true));
    });
    on<UseMaterialThreeFalseEvent>((event, emit) {
      emit(const UseMaterialThreeState(useMaterialThree: false));
    });
    on<UseMaterialThreeToggleEvent>((event, emit) {
      emit(UseMaterialThreeState(useMaterialThree: !state.useMaterialThree));
    });
  }

  @override
  UseMaterialThreeState? fromJson(Map<String, dynamic> json) {
    return UseMaterialThreeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(UseMaterialThreeState state) {
    return state.toMap();
  }
}
