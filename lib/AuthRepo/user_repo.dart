import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  late int id;
  late String name;
  late String town;
  late String city;
  late int gender;
  late String number;
  late String? photoUrl;
  UserData({
    required this.id,
    required this.name,
    required this.city,
    required this.gender,
    required this.number,
    required this.town,
    required this.photoUrl,
  });
  UserData.fromJson(Map<String, dynamic> json) {
    id = json['kisi_id'];
    name = json['kisi_ad'];
    city = json['city_name'];
    town = json['town_name'];
    gender = json['cinsiyet'];
    number = json['kisi_tel'];
    photoUrl = json['resim'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['kisi_id'] = id;
    data['kisi_ad'] = name;
    data['city_name'] = city;
    data['town_name'] = town;
    data['cinsiyet'] = gender;
    data['kisi_tel'] = number;
    data['resim'] = photoUrl;
    return data;
  }

  @override
  List<Object?> get props => [name, city, gender];
}
