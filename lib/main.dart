import 'package:ccstudy_app/pages/login.dart';
import 'package:ccstudy_app/providers/crear_usuario_provider.dart';
import 'package:ccstudy_app/providers/iniciar_sesion_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(
// // Replace with actual values
//       options: const FirebaseOptions(
//     apiKey: "AIzaSyCtA1r2SMUldsvazVOgicqk7TMI5Tq_GOA",
//     appId: "1:847210502911:android:58b1c0b23e211b03874aca",
//     messagingSenderId: "messaging id",
//     projectId: "ccstudy-f84d3",
//   ));

  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GestionUsuarioProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ccstudy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff271789)),
          useMaterial3: true,
        ),
        home: LoginPage());
  }
}
