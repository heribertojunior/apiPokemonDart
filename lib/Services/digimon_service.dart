import 'dart:convert';

import '../Models/digimon.dart';
import 'package:http/http.dart' as http;

class DigimonService {
  Future<List<Digimon>?> getDigimons() async {
    final response =
        await http.get(Uri.https("digimon-api.herokuapp.com", "/api/digimon"));
    if (response.statusCode == 200 || response.statusCode == 201) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => Digimon.fromJson(e)).toList();
    } else {
      null;
    }
  }
}
