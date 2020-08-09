import 'dart:convert';

import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProviders{


  String _apikey="238e8519ca618c5e454f5fa6d274ab10";
  String _url ="api.themoviedb.org";
  String _lenguage="es-ES";



  Future<List<Pelicula>> getEnCines() async{

      final url = Uri.https(_url, "3/movie/now_playing",{
          "api_key":_apikey,
          "lenguage":_lenguage,
      });

      final respuesta= await http.get(url);
      final decodedData = json.decode(respuesta.body);

      final peliculas = new Peliculas.fromJsonList(decodedData["results"]);
      return peliculas.items;


  }


  
}