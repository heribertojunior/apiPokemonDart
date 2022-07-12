import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DigimonCard extends StatelessWidget {
  const DigimonCard(
      {Key? key,
      required this.nome_digimon,
      required this.imagem_digimon,
      required this.level_digimon})
      : super(key: key);
  final String nome_digimon;
  final String imagem_digimon;
  final String level_digimon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          final snack = SnackBar(
            content: Text(this.nome_digimon),
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
        },
        child: Card(
          elevation: 2,
          child: SizedBox(
            width: double.infinity,
            child: Row(children: [
              Expanded(
                  child: Container(
                child: Image.network('$imagem_digimon'),
              )),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$nome_digimon',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text('$level_digimon')
                ],
              ))
            ]),
          ),
        ),
      ),
    );
  }
}
