import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:healthsync/Authentication/authentication_page.dart';
import 'package:healthsync/Home/home_page.dart';
import 'dart:developer' as developer;

class AppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      name: 'home',
      redirect: (context, state) {
        String path = '/';
        if (FirebaseAuth.instance.currentUser == null) {
          path = '/auth';
          developer.log('(router_config) : path = /auth');
          return path;
        } else {
          developer.log('(router_config) : path = /');
          return path;
        }
      },
      builder: (context, state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/auth',
      name: 'auth',
      builder: (context, state) {
        return const AuthenticationPage();
      },
    ),
  ]);
}
