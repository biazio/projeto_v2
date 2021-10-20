// ignore_for_file: unnecessary_new, use_key_in_widget_constructors, deprecated_member_use, prefer_const_constructors, unnecessary_string_interpolations, prefer_const_constructors_in_immutables, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_v2/logic/authentication/auth_bloc.dart';
import 'package:projeto_v2/logic/authentication/auth_event.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: List.generate(
              choices.length,
              (index) {
                return Center(
                    child: ChoiceCard(
                        choice: choices[index],
                        item: choices[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Detail(choice: choices[index])),
                          );
                        }));
              },
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(Logout());
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Text("Sessão finalizada!"),
                    actions: [
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Fechar')),
                    ],
                  );
                });
          },
          tooltip: 'Logout',
          child: Icon(Icons.logout),
        ));
  }
}

class Choice {
  const Choice({required this.title, required this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Book 1', icon: Icons.book),
  Choice(title: 'Book 2', icon: Icons.book),
  Choice(title: 'Book 3', icon: Icons.book),
  Choice(title: 'Book 4', icon: Icons.book),
  Choice(title: 'Book 5', icon: Icons.book),
];

class ChoiceCard extends StatelessWidget {
  ChoiceCard(
      {Key? key,
      required this.choice,
      required this.onTap,
      required this.item,
      this.selected = false})
      : super(key: key);

  final Choice choice;
  final VoidCallback onTap;
  final Choice item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.headline4;
    if (selected)
      textStyle = textStyle!.copyWith(color: Colors.lightGreenAccent[400]);
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              new Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.topLeft,
                  child: Icon(
                    choice.icon,
                    size: 80.0,
                    color: textStyle?.color,
                  )),
              new Expanded(
                  child: new Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.topLeft,
                child: Text(
                  choice.title,
                  style: null,
                  textAlign: TextAlign.left,
                  maxLines: 5,
                ),
              )),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          )),
    );
  }
}

class Detail extends StatelessWidget {
  final Choice choice;
  Detail({required this.choice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes"),
      ),
      body: Column(
        children: <Widget>[
          Text("${choice.title}"),
          Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar'),
            ),
          ),
        ],
      ),
    );
  }
}
