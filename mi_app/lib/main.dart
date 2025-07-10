import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_app/core/router/app_router.dart';

void main() {
  // Arranca la app dentro de ProviderScope para usar Riverpod en todo el árbol
  runApp(const ProviderScope(child: MyApp()));
}

// MyApp define el MaterialApp con routing
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Conecta con go_router para navegar entre pantallas
      routerConfig: appRouter,
      title: 'Mi App Flutter',
      debugShowCheckedModeBanner: false,
    );
  }
}

// Para correr en release sin lag:
// flutter run --release -d 0C64C10G261022B7

// Si hay problemas, limpiar y reinstalar dependencias:
// flutter clean
// flutter pub get
