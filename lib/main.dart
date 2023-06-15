import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_dev_test_sprout_prabowo/view/pokemons_page_view.dart';
import 'package:mobile_dev_test_sprout_prabowo/view_model/pokemin_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokemonViewModel(),
      child: MaterialApp(
        title: 'PokeAPI Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: PokemonPage(),
      ),
    );
  }
}
