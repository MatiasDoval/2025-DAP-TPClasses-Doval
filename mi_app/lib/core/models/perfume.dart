// Aca se define cómo es un perfume en nuestra app
class Perfume {
  // ruta de la imagen en assets, nombre visible, marca y texto de descripción
  final String assetPath;
  final String name;
  final String brand;
  final String description;

  // constructor obligatorio para nombre, marca y descripción
  // si no se pasa ruta de imagen usa 'pregunta.png' automáticamente
  Perfume({
    required this.name,
    required this.brand,
    required this.description,
    String? assetPath,
  }) : assetPath = assetPath ?? 'assets/images/pregunta.png';
}

// lista con los perfumes que queremos mostrar desde el principio
final initialPerfumes = [
  Perfume(
    assetPath: 'assets/images/le-male.jpg',
    name: 'Le Male',
    brand: 'Jean Paul Gaultier',
    description: 'Un perfume dulce y especiado, ideal para la noche.',
  ),
  Perfume(
    assetPath: 'assets/images/LE-BEAU-LE-PARFUM-ingredients-600x727.jpg',
    name: 'Le Beau',
    brand: 'Jean Paul Gaultier',
    description: 'Fresco, tropical y atractivo, para uso diario.',
  ),
  Perfume(
    assetPath: 'assets/images/EROS-FLAME-EDP2.jpg',
    name: 'Eros Flame',
    brand: 'Versace',
    description: 'Intenso y masculino con toques cítricos y amaderados.',
  ),
];
