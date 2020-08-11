import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_providers.dart';


class DataSerach extends SearchDelegate{

  final peliculas=["spider","batman","aquaman","superman"];
  final peliculasRecientes=["spiderman","capamerica"];


  final peliculasProvider =  new PeliculasProviders();
  @override
  List<Widget> buildActions(BuildContext context) {
      // : las acciones de nustro appbar 
      return [
        IconButton(
           icon :Icon(Icons.clear),
          onPressed: (){
            query="";
          },
        ),        
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // : icono a la izquerda del appbar 
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: (){
          close(context, null);
        },
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      //  crea los resultados que vamos a mostrar 
      return Center(
        
      );
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty)return Container();

    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),      
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if (snapshot.hasData){

          return ListView( 
            children: snapshot.data.map((pelicula) {
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage("assets/img/no-image.jpg"),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(pelicula.title),
                subtitle: Text(pelicula.originalTitle),
                onTap: (){
                  close(context, null);                  
                  Navigator.pushNamed(context, "detalle",arguments : pelicula);
                },
              );
            }).toList(),
          );
        }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      
    );
  }

/*
 @override
    Widget buildSuggestions(BuildContext context) {
    // : las sugerencias que aárecen cuando la persona escribe 

    final listasugeridda= (query.isEmpty)
                                ?peliculasRecientes
                                :peliculas.where((element) => element.toLowerCase().startsWith(query)
                                ).toList();


    return ListView.builder(
        itemCount: listasugeridda.length,
        itemBuilder: (contex,i){
          return ListTile(
            leading: Icon(Icons.movie),
            title: Text(listasugeridda[i]),
            onTap: (){},
          );
        },
      
      );
  }
*/
  


}