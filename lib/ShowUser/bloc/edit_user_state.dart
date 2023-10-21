part of 'edit_user_bloc.dart';

sealed class EditUserState extends Equatable {
  const EditUserState();

  @override
  List<Object> get props => [];
}

final class EditUserInitial extends EditUserState {}

class EditLoading extends EditUserState {}

class EditSucces extends EditUserState {
  String succesMessage;
  EditSucces({required this.succesMessage});
}

class EditFailed extends EditUserState {
  String failedMessage;
  EditFailed({required this.failedMessage});
}
