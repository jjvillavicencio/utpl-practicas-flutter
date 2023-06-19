// To parse this JSON data, do
//
//     final pokemonModel = pokemonModelFromJson(jsonString);

import 'dart:convert';

PokemonResponseModel pokemonModelFromJson(String str) =>
    PokemonResponseModel.fromJson(json.decode(str));

String pokemonModelToJson(PokemonResponseModel data) =>
    json.encode(data.toJson());

class PokemonResponseModel {
  int count;
  String next;
  dynamic previous;
  List<PokemonModel> results;

  PokemonResponseModel({
    required this.count,
    required this.next,
    this.previous,
    required this.results,
  });

  factory PokemonResponseModel.fromJson(Map<String, dynamic> json) =>
      PokemonResponseModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<PokemonModel>.from(
            json["results"].map((x) => PokemonModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class PokemonModel {
  String name;
  String url;

  PokemonModel({
    required this.name,
    required this.url,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
