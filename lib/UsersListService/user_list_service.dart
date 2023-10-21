import "package:http/http.dart" as http;

class UserListService {
  Future<http.Response> fetchUsersList(String email, String password, int page,
      String? cityId, String? cinsiyet, String? kisi_ad) async {
    final response = await http.post(
      Uri.parse(
          "http://www.motosikletci.com/api/kisiler?page=$page&email=$email&sifre=$password&city_id=$cityId&cinsiyet=$cinsiyet&kisi_ad=$kisi_ad"),
    );
    return response;
  }
}
