import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:go_router/go_router.dart';
import 'package:healthsync/helper/router_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAUt8OvsBvffypjSGLRc0UH2LGOAl0K8Zg",
          authDomain: "health-sync-55923.firebaseapp.com",
          projectId: "health-sync-55923",
          storageBucket: "health-sync-55923.appspot.com",
          messagingSenderId: "963688951929",
          appId: "1:963688951929:web:dd726f763ff745529c24a8",
          measurementId: "G-HGKD7S86K3"));
  setUrlStrategy(PathUrlStrategy());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter appRouter = AppRouter().router;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Health Sync',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      // debugShowMaterialGrid: true,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
