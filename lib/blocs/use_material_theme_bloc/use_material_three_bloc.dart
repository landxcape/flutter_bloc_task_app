import 'package:equatable/equatable.dart';

import '../bloc_exports.dart';

part 'use_material_three_event.dart';
part 'use_material_three_state.dart';

class UseMaterialThreeBloc extends HydratedBloc<UseMaterialThreeEvent, UseMaterialThreeState> {
  UseMaterialThreeBloc() : super(const UseMaterialThreeInitial()) {
    // on<UseMaterialThreeEvent>(
    //   (event, emit) {
    //     if (event is UseMaterialThreeTrueEvent) {
    //       emit(const UseMaterialThreeState(useMaterialThree: true));
    //     } else if (event is UseMaterialThreeFalseEvent) {
    //       emit(const UseMaterialThreeState(useMaterialThree: false));
    //     }
    //   },
    // );
    on<UseMaterialThreeTrueEvent>((event, emit) {
      emit(const UseMaterialThreeState(useMaterialThree: true));
    });
    on<UseMaterialThreeFalseEvent>((event, emit) {
      emit(const UseMaterialThreeState(useMaterialThree: false));
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
