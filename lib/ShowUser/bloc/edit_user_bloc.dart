import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

part 'edit_user_event.dart';
part 'edit_user_state.dart';

class EditUserBloc extends Bloc<EditUserEvent, EditUserState> {
  EditUserBloc() : super(EditUserInitial()) {
    on<EditUserEvent>((event, emit) async {
      emit(EditLoading());

      final result = await http.post(Uri.parse(""));
    });
  }
}
