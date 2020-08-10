import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_providers.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:peliculas/src/widgets/movie_horizontal.dart'; 

class HomePage extends StatelessWidget {
 
 final peliculasPrivider =  new PeliculasProviders();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("pelioculas en cartelera"),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
        body:Container(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             _swiperTarjetas(),
             _foother(context),
           ],
         ),
        ),
    );
  }

  Widget _swiperTarjetas() {

      return FutureBuilder(
        future: peliculasPrivider.getEnCines(),        
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData){
          return CardSwiper(
            peliculas: snapshot.data,
          );
          }
          else{
            return Container(
              height: 400.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      );
  }
  Widget _foother(context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,        
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text("populares", style: Theme.of(context).textTheme.subtitle1,)),
          SizedBox(height: 8.0,),
          FutureBuilder(
            future: peliculasPrivider.getPopulares(),            
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData){
                return MovieHorizontal(
                  peliculas: snapshot.data,
                );
              }
              else{
                return
                     Container(
                       alignment: Alignment.center,
                       child: CircularProgressIndicator());                  
              }
            },
          ),
        ],
      ),
    );

  }
}