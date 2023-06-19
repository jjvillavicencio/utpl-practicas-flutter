import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practicas/models/pokemon_response_model.dart';

class PokemonsProvider {
  // Funcion que retorna listado de Noticias
  Future<List<PokemonModel>> fetchPokemons() async {
    Map<String, dynamic> jsonData = <String, dynamic>{};
    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=150'));
    if (response.statusCode == 200) {
      final data = response.body;
      jsonData = json.decode(data);
    } else {
      print('Error: ${response.statusCode}');
    }
    List<dynamic> data = jsonData['results'];
    return data.map((item) => PokemonModel.fromJson(item)).toList();
  }
}
