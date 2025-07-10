// Modelo de usuario: aquí definimos qué datos tiene cada uno
class User {
  final String email; // email para iniciar sesión
  final String password; // contraseña
  final String name; // nombre que se mostrará en pantalla
  final String address; // dirección del usuario

  // Constructor: obliga a pasar los 4 datos al crear un User
  User({
    required this.email,
    required this.password,
    required this.name,
    required this.address,
  });
}

// Lista de usuarios hardcodeados
final List<User> users = [
  User(
    email: 'matias@gmail.com',
    password: 'matias',
    name: 'Matias',
    address: 'Calle 1',
  ),
  User(
    email: 'lucas@gmail.com',
    password: 'lucas',
    name: 'Lucas',
    address: 'Calle 2',
  ),
  User(
    email: 'gaston@gmail.com',
    password: 'gaston',
    name: 'Gaston',
    address: 'Calle 3',
  ),
  User(
    email: 'silvina@gmail.com',
    password: 'silvina',
    name: 'Silvina',
    address: 'Calle 4',
  ),
  User(
    email: 'juana@gmail.com',
    password: 'juana',
    name: 'Juana',
    address: 'Calle 5',
  ),
  User(
    email: 'juani@gmail.com',
    password: 'juani',
    name: 'Juani',
    address: 'Calle 6',
  ),
];
