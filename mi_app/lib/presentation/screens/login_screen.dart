import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mi_app/core/models/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // guardan lo que el usuario escribe
  String email = '';
  String pass = '';

  // mensaje que muestra si algo sale mal
  String msg = '';
  Color msgColor = Colors.black;

  // este método revisa email y contraseña
  void _validate() {
    final e = email.trim(); // quita espacios
    final p = pass.trim();

    // buscamos en la lista un usuario con ese email
    final user = users.firstWhere(
      (u) => u.email == e,
      orElse: () => User(email: '', password: '', name: '', address: ''),
    );

    // si no lo encontramos, user.email está vacío
    if (user.email.isEmpty) {
      setState(() {
        msg = 'El usuario no existe.';
        msgColor = Colors.red;
      });
      return;
    }

    // si la contraseña no coincide
    if (user.password != p) {
      setState(() {
        msg = 'Contraseña incorrecta.';
        msgColor = Colors.red;
      });
      return;
    }

    // si todo está bien, vamos a Home pasando el usuario
    context.go('/home', extra: user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')), // título fijo
      body: Padding(
        padding: const EdgeInsets.all(20), // espacio alrededor
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // centrado vertical
          children: [
            // campo para escribir el email
            TextField(
              onChanged: (v) => email = v,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20),
            // campo para escribir la contraseña
            TextField(
              onChanged: (v) => pass = v,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true, // oculta lo que escribe
            ),
            const SizedBox(height: 30),
            // botón que dispara la validación
            ElevatedButton(onPressed: _validate, child: const Text('Ingresar')),
            const SizedBox(height: 20),
            // aquí mostramos el mensaje de error si hay
            Text(msg, style: TextStyle(color: msgColor)),
          ],
        ),
      ),
    );
  }
}
