import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mi_app/core/providers/perfume_provider.dart';

// Pantalla principal donde se listan todos los perfumes.
// Cada elemento muestra imagen, nombre y marca, y permite ver detalle o editar.
class PerfumeListScreen extends ConsumerWidget {
  const PerfumeListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtengo la lista actualizada de perfumes desde el provider
    final lista = ref.watch(perfumeListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo de Perfumes')),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (_, i) {
          final p = lista[i]; // cada objeto Perfume
          return ListTile(
            leading: Image.asset(
              p.assetPath, // ruta local de la imagen
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(p.name), // nombre del perfume
            subtitle: Text(p.brand), // marca del perfume
            // Al tocar el tile, navegamos a la pantalla de detalle
            onTap: () => context.push('/perfumes/detail', extra: p),

            // Icono de lápiz para editar en el formulario
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => context.go(
                '/perfumes/form',
                extra: {'action': 'edit', 'perfume': p},
              ),
            ),
          );
        },
      ),

      // Botón para agregar un nuevo perfume
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/perfumes/form', extra: {'action': 'add'}),
        child: const Icon(Icons.add),
      ),
    );
  }
}
