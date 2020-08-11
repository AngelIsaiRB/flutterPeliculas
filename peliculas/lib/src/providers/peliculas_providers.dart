import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/actores_model.dart';
import 'package:peliculas/src/models/pelicula_model.dart';


class PeliculasProviders{


  String _apikey="238e8519ca618c5e454f5fa6d274ab10";
  String _url ="api.themoviedb.org";
  String _lenguage="es-ES";

  int _popularesPage=0;
  bool _cargando=false;

  List<Pelicula> _populares =new List();

  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;


  void disposeStreams(){
    _popularesStreamController?.close();
  }


  Future <List<Pelicula>>_procesarRespuesta(Uri url) async{
    final respuesta= await http.get(url);
      final decodedData = json.decode(respuesta.body);

      final peliculas = new Peliculas.fromJsonList(decodedData["results"]);
      return peliculas.items;

  }

  Future<List<Pelicula>> getEnCines() async{

      final url = Uri.https(_url, "3/movie/now_playing",{
          "api_key":_apikey,
          "language":_lenguage,
      });

      return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopulares() async{

    if(_cargando)return[];
    _cargando=true;
    _popularesPage++;
    final url = Uri.https(_url, "3/movie/popular",{
      "api_key":_apikey,
      "language": _lenguage,
      "page":    _popularesPage.toString()
    });

    final respuesta= await _procesarRespuesta(url);
    _populares.addAll(respuesta);
    popularesSink(_populares);
    _cargando=false;
    return respuesta;
    
  }

 Future <List<Actor>> getActores(String idPelicula)async {

    final url = Uri.https(_url, "3/movie/$idPelicula/credits",{
          "api_key":_apikey,
          "lenguage":_lenguage,
      });
    final resp = await http.get(url);
    final decode = json.decode(resp.body);
    final cas = new Cast.fromJsonList(decode["cast"]);
    return cas.actorers; 

  }


  Future<List<Pelicula>> buscarPelicula(String pelicula) async{

      final url = Uri.https(_url, "3/search/movie",{
          "api_key":_apikey,
          "language":_lenguage,
          "query"   :pelicula
      });

      return await _procesarRespuesta(url);
  }
  
}