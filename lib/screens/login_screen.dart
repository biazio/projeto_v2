// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_v2/layout/layout.dart';
import 'package:projeto_v2/logic/authentication/auth_bloc.dart';
import 'package:projeto_v2/logic/authentication/auth_event.dart';
import 'package:projeto_v2/logic/authentication/auth_state.dart';
import 'package:projeto_v2/screens/register_screen.dart';

var username2;
var id;
var user;

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    String? username;
    String? password;

    return BlocProvider(
        create: (context) => AuthBloc(),
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is Unauthenticated) {
            return Scaffold(
              appBar: AppBar(title: Text("Login")),
              body: Form(
                key: formkey,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Usuário"),
                          validator: (String? inValue) {
                            if (inValue!.length == 0) {
                              return "Insira algo como username";
                            }
                            return null;
                          },
                          onSaved: (String? inValue) {
                            username = inValue!;
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "Senha"),
                          validator: (String? inValue) {
                            if (inValue!.length < 4) {
                              return "Tem que ter ao menos 4 caracters";
                            }
                            return null;
                          },
                          onSaved: (String? inValue) {
                            password = inValue!;
                          },
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  formkey.currentState!.save();
                                  // Lançando evento
                                  username2 = username;
                                  BlocProvider.of<AuthBloc>(context).add(
                                      LoginUser(
                                          username: username,
                                          password: password));
                                }
                              },
                              child: Text("Entrar"),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen()));
                                },
                                child: Text("Cadastrar-se"))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (state is Authenticated) {
            id = state.id;
          }
          return MyTabBarLayout();
        }));
  }
}
