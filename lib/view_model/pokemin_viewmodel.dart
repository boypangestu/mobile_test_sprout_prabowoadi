import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_dev_test_sprout_prabowo/model/pokemon_model.dart';

class PokemonViewModel extends ChangeNotifier {
  List<Pokemon> _pokemonList = [];
  bool _isLoading = false;

  List<Pokemon> get pokemonList => _pokemonList;
  bool get isLoading => _isLoading;

  Future<void> fetchPokemonList() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response =
          await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> results = jsonData['results'];

        _pokemonList = await _fetchPokemonDetails(results);
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<List<Pokemon>> _fetchPokemonDetails(List<dynamic> results) async {
    final List<Pokemon> pokemonDetails = [];

    for (final pokemonData in results) {
      final response = await http.get(Uri.parse(pokemonData['url']));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final Pokemon pokemon = Pokemon.fromJson(jsonData);
        pokemonDetails.add(pokemon);
      } else {
        throw Exception('Failed to fetch data for ${pokemonData['name']}');
      }
    }

    return pokemonDetails;
  }
}
