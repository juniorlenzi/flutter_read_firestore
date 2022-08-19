import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_fstore/countries.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCL311wVU1b-pdDuxdF9iz2EI3rmiZC-a0",
      appId: "1:424362068694:web:63531a812106f9b085d777",
      messagingSenderId: "424362068694",
      projectId: "smash-344ec",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const CountriesPage(),
    );
  }
}
