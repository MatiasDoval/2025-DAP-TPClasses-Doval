import 'package:go_router/go_router.dart';
import 'package:mi_app/presentation/screens/login_screen.dart';
import 'package:mi_app/presentation/screens/home_screen.dart';
import 'package:mi_app/presentation/screens/perfume_list_screen.dart';
import 'package:mi_app/presentation/screens/perfume_form_screen.dart';
import 'package:mi_app/presentation/screens/perfume_detail_screen.dart';
import 'package:mi_app/core/models/user.dart';
import 'package:mi_app/core/models/perfume.dart';

// Aca creamos y configuramos el router de la app.
// initialLocation es la ruta que aparece al iniciar (Login).
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // Ruta raíz, pantalla de login
    GoRoute(path: '/', builder: (_, __) => const LoginScreen()),

    // Ruta Home que recibe un User por extra
    GoRoute(
      path: '/home',
      builder: (context, state) {
        // Extrae el User pasado desde el login
        final user = state.extra as User;
        return HomeScreen(user: user);
      },
    ),

    // Ruta de la lista de perfumes
    GoRoute(
      path: '/perfumes',
      builder: (_, __) => const PerfumeListScreen(),
      routes: [
        // Subruta de 'form' para agregar, ver o editar perfumes
        GoRoute(
          path: 'form',
          builder: (context, state) {
            // Lee los parámetros action y perfume desde extra
            final args = (state.extra as Map<String, dynamic>?) ?? {};
            final action = args['action'] as String;
            final perfume = args['perfume'] as Perfume?;
            return PerfumeFormScreen(action: action, perfume: perfume);
          },
        ),
      ],
    ),

    // Ruta de pantalla de detalle de un perfume específico
    GoRoute(
      path: '/perfumes/detail',
      builder: (_, state) {
        // Recibe el objeto Perfume completo por extra
        final p = state.extra as Perfume;
        return PerfumeDetailScreen(perfume: p);
      },
    ),
  ],
);
