import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_app/core/models/perfume.dart';

// Aca guardamos la lista de perfumes que se muestra y modifica en la app.
// Arranca con una copia de los 'initialPerfumes' para no tocar la lista original.
final perfumeListProvider = StateProvider<List<Perfume>>(
  (ref) => List.from(initialPerfumes),
);
