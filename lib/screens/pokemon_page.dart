import 'package:flutter/material.dart';
import 'package:practicas/models/pokemon_response_model.dart';
import 'package:practicas/providers/pokemon_provider.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPage();
}

class _PokemonPage extends State<PokemonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Listado de Pokemons',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<PokemonModel>>(
        future: PokemonsProvider().fetchPokemons(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PokemonModel> items = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Número de columnas en la cuadrícula
                mainAxisSpacing: 1.0, // Espacio vertical entre los elementos
                crossAxisSpacing: 1, // Espacio horizontal entre los elementos
                childAspectRatio:
                    3 / 2, // Relación de aspecto de cada elemento (ancho:alto)
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                PokemonModel item = items[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.downloading),
                      ),
                      Text(
                        item.name.toUpperCase(),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        item.url,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error al obtener los datos'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
