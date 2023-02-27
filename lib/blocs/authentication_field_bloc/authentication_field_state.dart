part of 'authentication_field_bloc.dart';

abstract class AuthenticationFieldState extends Equatable {
  const AuthenticationFieldState();
  
  @override
  List<Object> get props => [];
}

class AuthenticationFieldInitial extends AuthenticationFieldState {}
