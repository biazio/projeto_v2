// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:projeto_v2/screens/account.dart';
import 'package:projeto_v2/screens/catalog_screen.dart';
import 'package:projeto_v2/screens/search_screen.dart';

class MyTabBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("AnyBook Project"),
            bottom: TabBar(
              tabs: [
                Tab(
                    child: Text("catálogo"),
                    icon: Icon(Icons.my_library_books)),
                Tab(child: Text("Pesquisa"), icon: Icon(Icons.search_sharp)),
                Tab(child: Text("Conta"), icon: Icon(Icons.account_circle)),
              ],
            ),
          ),
          body: TabBarView(
              children: [CatalogScreen(), SearchScreen(), Account()])),
    );
  }
}
