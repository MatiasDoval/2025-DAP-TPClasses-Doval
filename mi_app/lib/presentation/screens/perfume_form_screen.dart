import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mi_app/core/providers/perfume_provider.dart';
import 'package:mi_app/core/models/perfume.dart';

// Pantalla que sirve para agregar, ver o editar un perfume.
// Se decide el modo por el parámetro 'action' y el objeto 'perfume' (opcional).
class PerfumeFormScreen extends ConsumerStatefulWidget {
  final String action; // 'add', 'view' o 'edit'
  final Perfume? perfume; // en view/edit trae el perfume a mostrar o modificar

  const PerfumeFormScreen({super.key, required this.action, this.perfume});

  @override
  ConsumerState<PerfumeFormScreen> createState() => _FormState();
}

class _FormState extends ConsumerState<PerfumeFormScreen> {
  // Controladores que manejan el texto de los campos
  late final TextEditingController _nameCtrl;
  late final TextEditingController _brandCtrl;
  late final TextEditingController _descCtrl;

  @override
  void initState() {
    super.initState();
    // Si venimos a ver o editar, cargamos los datos en los campos
    _nameCtrl = TextEditingController(text: widget.perfume?.name ?? '');
    _brandCtrl = TextEditingController(text: widget.perfume?.brand ?? '');
    _descCtrl = TextEditingController(text: widget.perfume?.description ?? '');
  }

  // Guarda o actualiza el perfume según el modo
  void _save() {
    final name = _nameCtrl.text.trim();
    final brand = _brandCtrl.text.trim();
    final desc = _descCtrl.text.trim();
    if (name.isEmpty || brand.isEmpty || desc.isEmpty) return;

    final notifier = ref.read(perfumeListProvider.notifier);
    final current = ref.read(perfumeListProvider);

    if (widget.action == 'add') {
      // Agrega un nuevo perfume a la lista
      notifier.state = [
        ...current,
        Perfume(name: name, brand: brand, description: desc),
      ];
    } else {
      // Reemplaza el perfume existente con los datos actualizados
      notifier.state = current.map((p) {
        if (p == widget.perfume) {
          return Perfume(
            assetPath: p.assetPath, // conserva la imagen
            name: name,
            brand: brand,
            description: desc,
          );
        }
        return p;
      }).toList();
    }

    // Volvemos a la pantalla anterior (lista o detalle)
    context.pop();
  }

  // Borra el perfume actual de la lista
  void _delete() {
    final notifier = ref.read(perfumeListProvider.notifier);
    notifier.state = ref
        .read(perfumeListProvider)
        .where((p) => p != widget.perfume)
        .toList();
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final isView = widget.action == 'view';
    final isEdit = widget.action == 'edit';

    return Scaffold(
      appBar: AppBar(
        // Título cambia según el modo
        title: Text(
          isView
              ? 'Ver Perfume'
              : isEdit
              ? 'Editar Perfume'
              : 'Agregar Perfume',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Campo Nombre, de sólo lectura en view
            TextField(
              controller: _nameCtrl,
              decoration: const InputDecoration(labelText: 'Nombre'),
              readOnly: isView,
            ),
            const SizedBox(height: 10),

            // Campo Marca, de sólo lectura en view
            TextField(
              controller: _brandCtrl,
              decoration: const InputDecoration(labelText: 'Marca'),
              readOnly: isView,
            ),
            const SizedBox(height: 10),

            // Campo Descripción, multilinea y sólo lectura en view
            TextField(
              controller: _descCtrl,
              decoration: const InputDecoration(labelText: 'Descripción'),
              readOnly: isView,
              maxLines: 3,
            ),
            const Spacer(),

            if (isView)
              // En modo ver, sólo damos botón para volver
              ElevatedButton(
                onPressed: () => context.pop(),
                child: const Text('Volver'),
              )
            else
              // En add/edit, ponemos botones para borrar (solo edit) y guardar/agregar
              Row(
                children: [
                  if (isEdit) ...[
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _delete,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text('Borrar'),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _save,
                      child: Text(isEdit ? 'Guardar' : 'Agregar'),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
