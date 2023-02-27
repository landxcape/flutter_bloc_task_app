part of 'use_material_three_bloc.dart';

abstract class UseMaterialThreeEvent extends Equatable {
  const UseMaterialThreeEvent();

  @override
  List<Object> get props => [];
}

class UseMaterialThreeTrueEvent extends UseMaterialThreeEvent {}

class UseMaterialThreeFalseEvent extends UseMaterialThreeEvent {}

class UseMaterialThreeToggleEvent extends UseMaterialThreeEvent {}
