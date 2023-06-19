import 'package:flutter/material.dart';

import 'package:practicas/screens/counter_page.dart';
import 'package:practicas/screens/menu_page.dart';
import 'package:practicas/screens/news_page.dart';
import 'package:practicas/screens/pokemon_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MenuPage(),
      routes: {
        '/contador': (BuildContext context) => const CounterPage(),
        '/news_page': (BuildContext context) => const NewsPage(),
        '/pokemon_page': (BuildContext context) => const PokemonPage(),
      },
    );
  }
}
