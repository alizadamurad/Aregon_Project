import 'package:bloc_example/ShowUser/show_user.dart';
import 'package:flutter/material.dart';

class KisilerListTile extends StatelessWidget {
  String name;
  String city;
  String town;
  String number;
  int gender;
  String? photoUrl;
  KisilerListTile({
    super.key,
    required this.city,
    required this.gender,
    required this.name,
    required this.number,
    required this.town,
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 10,
        bottom: 5,
      ),
      child: SizedBox(
        height: 130,
        child: Card(
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: photoUrl != null
                          ? NetworkImage(
                              'http://www.motosikletci.com/upload/kisi/$photoUrl',
                            )
                          : null,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          "$city\n$town\n$number\n${gender == 1 ? "Erkek" : "Kadın"}",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowUser(
                                    name: name,
                                    cityName: city,
                                    number: number,
                                    townName: town,
                                    resim: photoUrl,
                                  )));
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: Color.fromARGB(255, 192, 32, 20),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
