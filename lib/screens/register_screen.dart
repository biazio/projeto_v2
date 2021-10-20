// ignore_for_file: prefer_const_constructors, prefer_is_not_operator, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_v2/logic/authentication/register_bloc.dart';
import 'package:projeto_v2/logic/authentication/register_event.dart';
import 'package:projeto_v2/logic/authentication/register_state.dart';
import 'package:projeto_v2/model/user.dart';
import 'package:projeto_v2/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    String? name;
    String? password;

    var blocProvider = BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(),
        child:
            BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
          if (!(state is Correct)) {
            User? user = User();
            var screen = Scaffold(
              appBar: AppBar(title: Text("Novo Cadastro")),
              body: Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(labelText: "Nome"),
                          validator: (String? inValue) {
                            if (inValue!.isEmpty) {
                              return "Insira algo como nome";
                            }
                            return null;
                          },
                          onSaved: (String? inValue) {
                            name = inValue!;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: "Senha"),
                          onSaved: (String? inValue) {
                            password = inValue;
                          },
                        ),
                        const SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
                              user.name = name!;
                              user.password = password!;

                              // Lançando evento
                              BlocProvider.of<RegisterBloc>(context)
                                  .add(Register(user: user));
                            }
                          },
                          child: const Text("Cadastre-se"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );

            return screen;
          } else {
            return LoginScreen();
          }
        }));
    return blocProvider;
  }
}
