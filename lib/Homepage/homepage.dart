import 'package:bloc_example/Constants/constant.dart';
import 'package:bloc_example/Homepage/user_list_builder.dart';
import 'package:bloc_example/UsersListService/user_list_bloc.dart';
import 'package:bloc_example/UsersListService/user_list_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

enum Gender { Erkek, Kadin }

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Gender selectedGender = Gender.Erkek;
    return BlocProvider(
      create: (_) => PostBloc(httpClient: http.Client())..add(PostFetched()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Homepage",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 0.3,
                    color: Colors.grey[500]!,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextFormField(
                              decoration: knameSearchBar,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: DropdownButtonFormField<Gender>(
                              decoration: kdropDowninputDecoration,
                              dropdownColor: Colors.grey[800],
                              borderRadius: BorderRadius.circular(10),
                              value: null,
                              items: Gender.values
                                  .map<DropdownMenuItem<Gender>>(
                                      (Gender value) {
                                return DropdownMenuItem<Gender>(
                                  value: value,
                                  child: Text(value == Gender.Erkek
                                      ? "Erkek"
                                      : "Kadın"),
                                );
                              }).toList(),
                              onChanged: (Gender? newGender) {
                                selectedGender = newGender!;
                                print(selectedGender);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 5,
                        bottom: 5,
                      ),
                      child: TextFormField(
                        decoration: kcitySearchBar,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.search,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: UserListBuilder()),
          ],
        ),
      ),
    );
  }
}
