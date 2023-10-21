part of 'edit_user_bloc.dart';

sealed class EditUserEvent extends Equatable {
  const EditUserEvent();

  @override
  List<Object> get props => [];
}

class ConfirmEdit extends EditUserEvent {
  String name;
  String city;
  String town;
  String number;
  ConfirmEdit(
      {required this.city,
      required this.name,
      required this.number,
      required this.town});
}
