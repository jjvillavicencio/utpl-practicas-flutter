import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:practicas/pages/counter/counter_binding.dart';
import 'package:practicas/pages/counter/counter_page.dart';
import 'package:practicas/screens/pokemon_page.dart';
import 'package:practicas/screens/carnet_page.dart';
import 'package:practicas/screens/menu_page.dart';
import 'package:practicas/screens/news_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const MenuPage(),
      routes: {
        /// NOTE: se sustituye por navegación con GetX
        // '/contador': (BuildContext context) => const CounterPage(),
        '/news_page': (BuildContext context) => const NewsPage(),
        '/pokemon_page': (BuildContext context) => const PokemonPage(),
        '/carnet_page': (BuildContext context) => const CarnetPage(),
      },
      getPages: [
        GetPage(
          transition: Transition.zoom,
          name: '/contador_get',
          page: () => const CounterPage(),
          bindings: [
            CounterBinding(),
          ],
        ),
      ],
    );
  }
}
