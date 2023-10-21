import 'package:bloc_example/Constants/constant.dart';
import 'package:flutter/material.dart';

class ShowUser extends StatelessWidget {
  String name;
  String cityName;
  String townName;
  String number;
  String? resim;

  ShowUser({
    super.key,
    required this.name,
    required this.cityName,
    required this.number,
    required this.townName,
    required this.resim,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController townController = TextEditingController();
    TextEditingController numberController = TextEditingController();

    nameController.text = name;
    cityController.text = cityName;
    numberController.text = number;
    townController.text = townName;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Kişi Detay",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: CircleAvatar(
              radius: 70,
              backgroundImage: resim != null
                  ? NetworkImage(
                      "http://www.motosikletci.com/upload/kisi/$resim")
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: nameController,
              decoration: customInputDecoration(
                  prefixIcon: Icons.person, hintText: "İsim"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: cityController,
              decoration: customInputDecoration(
                  prefixIcon: Icons.location_on, hintText: "İl"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: townController,
              decoration: customInputDecoration(
                  prefixIcon: Icons.location_on, hintText: "İlçe"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: numberController,
              decoration: customInputDecoration(
                  prefixIcon: Icons.phone, hintText: "Numara"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey[500])),
                onPressed: () {},
                child: Text(
                  "Kaydet",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
