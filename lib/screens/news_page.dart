import 'package:flutter/material.dart';
import 'package:practicas/models/news_model.dart' as news_model;
import 'package:practicas/providers/news_provider.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPage();
}

class _NewsPage extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Listado noticias',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<news_model.NewModel>>(
        future: NewsProvider().fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<news_model.NewModel> items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                news_model.NewModel item = items[index];
                return ListTile(
                  leading: Image.network(
                    item.image.url,
                    fit: BoxFit
                        .cover, // Ajustar el tamaño de la imagen al contenedor
                    errorBuilder: (context, error, stackTrace) {
                      // Widget de sustitución en caso de error de carga
                      return const Icon(Icons.error);
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        // La imagen ha terminado de cargar
                        return child;
                      }
                      // Mientras la imagen carga, se puede mostrar un indicador de progreso
                      return const CircularProgressIndicator();
                    },
                  ),
                  title: Text(
                    item.title,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    item.description,
                    maxLines: 2,
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
