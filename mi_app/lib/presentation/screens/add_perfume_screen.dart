import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mi_app/core/providers/perfume_provider.dart';
import 'package:mi_app/core/models/perfume.dart';

class AddPerfumeScreen extends ConsumerStatefulWidget {
  const AddPerfumeScreen({super.key});
  @override
  ConsumerState<AddPerfumeScreen> createState() => _AddPerfumeScreenState();
}

class _AddPerfumeScreenState extends ConsumerState<AddPerfumeScreen> {
  // Controladores para guardar lo que escribe el usuario
  final _nameCtrl = TextEditingController();
  final _brandCtrl = TextEditingController();
  final _descCtrl = TextEditingController();

  // Cuando el usuario toca "Guardar", validamos y añadimos el perfume
  void _submit() {
    final name = _nameCtrl.text.trim();
    final brand = _brandCtrl.text.trim();
    final desc = _descCtrl.text.trim();
    if (name.isEmpty || brand.isEmpty || desc.isEmpty) return;

    // Leemos la lista actual, añadimos el nuevo perfume y actualizamos el provider
    ref.read(perfumeListProvider.notifier).state = [
      ...ref.read(perfumeListProvider),
      Perfume(name: name, brand: brand, description: desc),
    ];

    // Volvemos a la pantalla anterior (la lista de perfumes)
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Perfume')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Campo para el nombre
            TextField(
              controller: _nameCtrl,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 10),

            // Campo para la marca
            TextField(
              controller: _brandCtrl,
              decoration: const InputDecoration(labelText: 'Marca'),
            ),
            const SizedBox(height: 10),

            // Campo para la descripción
            TextField(
              controller: _descCtrl,
              decoration: const InputDecoration(labelText: 'Descripción'),
              maxLines: 3,
            ),
            const SizedBox(height: 30),

            // Botón para guardar, llama a _submit()
            ElevatedButton(onPressed: _submit, child: const Text('Guardar')),
          ],
        ),
      ),
    );
  }
}
