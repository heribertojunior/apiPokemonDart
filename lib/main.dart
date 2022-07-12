import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto6/Screens/tela_inicial.dart';
import 'package:projeto6/Services/digimon_service.dart';

void setLocator() {
  GetIt.instance.registerLazySingleton(() => DigimonService());
}

void main() {
  setLocator();
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
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Digimons"),
        ),
        body: TelaInicia(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
