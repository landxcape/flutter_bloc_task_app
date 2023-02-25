part of 'use_material_three_bloc.dart';

class UseMaterialThreeState extends Equatable {
  const UseMaterialThreeState({required this.useMaterialThree});
  final bool useMaterialThree;

  @override
  List<Object> get props => [];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'useMaterialThree': useMaterialThree,
    };
  }

  factory UseMaterialThreeState.fromMap(Map<String, dynamic> map) {
    return UseMaterialThreeState(
      useMaterialThree: map['useMaterialThree'] as bool,
    );
  }
}

class UseMaterialThreeInitial extends UseMaterialThreeState {
  const UseMaterialThreeInitial({super.useMaterialThree = true});
}
