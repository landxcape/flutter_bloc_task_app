import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_field_event.dart';
part 'authentication_field_state.dart';

class AuthenticationFieldBloc extends Bloc<AuthenticationFieldEvent, AuthenticationFieldState> {
  AuthenticationFieldBloc() : super(AuthenticationFieldInitial()) {
    on<AuthenticationFieldEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
