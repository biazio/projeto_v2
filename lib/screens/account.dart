// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_v2/layout/layout.dart';
import 'package:projeto_v2/logic/authentication/user_bloc.dart';
import 'package:projeto_v2/logic/authentication/user_event.dart';
import 'package:projeto_v2/logic/authentication/user_state.dart';
import 'package:projeto_v2/screens/login_screen.dart';
import '../main.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Account({Key? key}) : super(key: key);
    GlobalKey<FormState> formProfileKey = GlobalKey();
    String name = user.name;
    String password = user.password;

    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Scaffold(
        body: Form(
          key: formProfileKey,
          child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Column(children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Nome Completo:",
                      border: OutlineInputBorder()),
                  initialValue: user.name,
                  validator: (String? inValue) {
                    return null;
                  },
                  onSaved: (String? inValue) {
                    var auxName = inValue;
                    if (auxName != null) {
                      name = auxName;
                    }
                  },
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Senha da conta:",
                      border: OutlineInputBorder()),
                  initialValue: user.password,
                  validator: (String? inValue) {
                    return null;
                  },
                  onSaved: (String? inValue) {
                    var auxPass = inValue;
                    if (auxPass != null) {
                      password = inValue!;
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (formProfileKey.currentState!.validate()) {
                          formProfileKey.currentState!.save();
                          user.name = name;
                          user.password = password;
                          BlocProvider.of<UserBloc>(context)
                              .add(UpdateUser(id, user));
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return MyTabBarLayout();
                          }));
                        }
                      },
                      child: Text("Atualizar dados"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<UserBloc>(context).add(DeleteUser(id));
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return MyApp();
                        }));
                      },
                      child: Text("Deletar Conta!"),
                    ),
                  ],
                )
              ] //children
                  )),
        ),
      );
      return Account();
    });
  }
}
