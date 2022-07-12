import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto6/Models/digimon.dart';
import 'package:projeto6/Services/digimon_service.dart';
import 'package:projeto6/Widgets/digimon_card.dart';

class TelaInicia extends StatefulWidget {
  const TelaInicia({Key? key}) : super(key: key);

  @override
  State<TelaInicia> createState() => _TelaIniciaState();
}

class _TelaIniciaState extends State<TelaInicia> {
  //Lista dos Digimons
  late Future<List<Digimon>?> futureDigimons;
  //Injeçao de dependencia usando o service
  DigimonService get service => GetIt.I<DigimonService>();

  @override
  void initState() {
    super.initState();
    // atribuindo valores a lista atravers do getDigimons()
    futureDigimons = service.getDigimons();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      child: FutureBuilder<List<Digimon>?>(
        future: futureDigimons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Digimon> data = snapshot.data!;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return DigimonCard(
                    nome_digimon: data[index].name as String,
                    imagem_digimon: data[index].img as String,
                    level_digimon: data[index].level as String,
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
