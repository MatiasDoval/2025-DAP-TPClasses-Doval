import 'package:flutter/material.dart';
import 'package:mi_app/core/models/perfume.dart';

/// Pantalla de detalle de un perfume.
/// Recibe un objeto `Perfume` con todos sus datos y los muestra ordenados.
class PerfumeDetailScreen extends StatelessWidget {
  final Perfume perfume; // guardamos el perfume que llega de la lista

  const PerfumeDetailScreen({super.key, required this.perfume});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // usamos el nombre del perfume como título de la barra
        title: Text(perfume.name),
        centerTitle: true, // centramos el texto del título
      ),
      body: SingleChildScrollView(
        // para hacer scroll si la descripción es larga
        padding: const EdgeInsets.all(20), // separa el contenido de los bordes
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // estira los hijos al ancho
          children: [
            Center(
              // imagen del perfume centrada y de tamaño fijo
              child: Image.asset(
                perfume.assetPath,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20), // espacio antes del nombre

            Text(
              perfume.name,
              // nombre grande y en negrita
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center, // centrado bajo la imagen
            ),
            const SizedBox(height: 10), // espacio antes de la marca

            Text(
              perfume.brand,
              // marca en letra más pequeña e itálica
              style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20), // espacio antes del separador

            const Divider(), // línea que separa el heading de descripción
            const SizedBox(height: 10), // pequeño espacio tras la línea

            Text(
              perfume.description,
              // descripción con un poco más de interlineado y justificada
              style: const TextStyle(fontSize: 16, height: 1.4),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
