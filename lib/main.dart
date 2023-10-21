import 'package:bloc_example/AuthRepo/auth_repo.dart';
import 'package:bloc_example/BlocAuth/bloc/auth_bloc.dart';
import 'package:bloc_example/Constants/constant.dart';
import 'package:bloc_example/Homepage/homepage.dart';
import 'package:bloc_example/LoginPage/login_page.dart';
import 'package:bloc_example/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(ApiConnect()),
      child: MaterialApp(
        routes: {
          '/login': (context) => const LoginPage(),
          '/homepage': (context) => HomePage(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: ktextTheme,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: kappbarColor,
          ),
          scaffoldBackgroundColor: kscaffoldColor,
          useMaterial3: true,
        ),
        home: LoginPage(),
      ),
    );
  }
}
