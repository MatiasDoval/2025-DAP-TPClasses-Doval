import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mi_app/core/models/user.dart';

// Pantalla Home: recibe un User y muestra su nombre, dirección y un botón para ver perfumes.
class HomeScreen extends StatelessWidget {
  final User user; // guardamos el usuario que llegó desde el login

  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'), // título fijo en la barra superior
      ),
      body: Padding(
        padding: const EdgeInsets.all(20), // espacio alrededor
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // centrar todo verticalmente
          children: [
            Text(
              'Bienvenido, ${user.name}', // saludo con nombre del usuario
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10), // espacio
            Text(
              'Tu dirección es: ${user.address}', // muestra la dirección
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30), // más espacio antes del botón
            ElevatedButton(
              // usamos push para apilar la lista y poder volver con atrás
              onPressed: () => context.push('/perfumes'),
              child: const Text('Ver Perfumes'),
            ),
          ],
        ),
      ),
    );
  }
}
