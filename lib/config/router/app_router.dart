import 'package:go_router/go_router.dart';
import 'package:river_app/presentation/screens.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    //se invoca cuando se navega a la ruta y es una funcion para que se contruya la pantalla
    //el state la informacion de la ruta y el context es el contexto de la app que es el arbol de widgets y todo de la app
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/state_provider',
    builder: (context, state) => const StateProviderScreen(),
  ),
  GoRoute(
    path: '/future_provider',
    builder: (context, state) => const PokemonScreen(),
  ),
  GoRoute(
    path: '/stream_provider',
    builder: (context, state) => const StreamScreen(),
  ),
  GoRoute(
    path: '/state-notifer-provider',
    builder: (context, state) => const TodosScreen(),
  )
]);
