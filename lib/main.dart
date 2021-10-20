// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_v2/logic/authentication/auth_bloc.dart';
import 'package:projeto_v2/logic/authentication/register_bloc.dart';
import 'package:projeto_v2/logic/authentication/user_bloc.dart';
import 'package:projeto_v2/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*home: BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(), child: LoginScreen()),*/
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => UserBloc()),
          BlocProvider(create: (context) => RegisterBloc()),
          BlocProvider(create: (context) => AuthBloc())
        ],
        child: MaterialApp(
          title: 'AnyBook App',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          home: LoginScreen(),
        ));
  }
}
