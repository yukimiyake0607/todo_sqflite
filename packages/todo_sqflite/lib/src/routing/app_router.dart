import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_sqflite/src/feature/root/root_screen.dart';

final routerProvider = Provider<GoRouter>((ref) => _router);

final GoRouter _router = GoRouter(
  routes: [GoRoute(path: '/', builder: (context, state) => RootScreen())],
);
