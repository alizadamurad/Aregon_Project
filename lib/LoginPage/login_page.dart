import 'package:bloc_example/BlocAuth/bloc/auth_bloc.dart';
import 'package:bloc_example/Constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  AuthBloc? _authBloc;
  final _formkey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormFieldState<String>>();
  final _passKey = GlobalKey<FormFieldState<String>>();
  @override
  void initState() {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Login",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.white,
          ),
        ),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _emailKey,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Eposta adresinizi giriniz";
                  }
                },
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.white,
                controller: _emailController,
                decoration: kemailinputDecoration,
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _passKey,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Şifre giriniz";
                  }
                },
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Colors.white,
                controller: _passController,
                decoration: kpassinputDecoration,
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 60,
                  child: BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthLoading) {
                        const CircularProgressIndicator();
                      } else if (state is AuthSuccess) {
                        Navigator.pushNamed(context, '/homepage');
                      } else if (state is AuthError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.errormsg.toString())));
                      }
                    },
                    child: ElevatedButton(
                      style: btnStyle,
                      onPressed: () {
                        print("OnPressed");
                        final _email = _emailController.text;
                        final _password = _passController.text;
                        if (_formkey.currentState!.validate()) {
                          _authBloc!.add(
                              LoginEvent(email: _email, password: _password));
                        }
                      },
                      child: const Text(
                        "Giriş",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
