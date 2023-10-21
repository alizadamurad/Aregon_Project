import 'package:bloc/bloc.dart';
import 'package:bloc_example/AuthRepo/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiConnect _apiConnect;
  AuthBloc(this._apiConnect) : super(AuthLoading()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await _apiConnect.login(event.email, event.password);
      if (result['basari'] == 1) {
        emit(AuthSuccess());
      } else if (result['basari'] == 0) {
        emit(AuthError(errormsg: result['mesaj']));
      }
    });
  }
}
