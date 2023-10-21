import 'package:equatable/equatable.dart';

sealed class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class PostFetched extends PostEvent {}

final class PostSearch extends PostEvent {
  String? cityId;
  String? kisiAd;
  String? cityName;
  PostSearch({this.cityId = "", this.cityName = "", this.kisiAd = ""});
}
