import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';


class MovieHorizontal extends StatelessWidget {
   final List<Pelicula> peliculas;
   final Function siguientePagina;

    

    MovieHorizontal({@required this.peliculas, @required this.siguientePagina});

    final _pageController = new PageController(
      initialPage: 1,
      
      viewportFraction: 0.26,
    );

  @override
  Widget build(BuildContext context) {
    final _screenZise= MediaQuery.of(context).size;
    _pageController.addListener(() { 
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200 ){
          siguientePagina();
      }
    });

    return Container(

        height: _screenZise.height*0.2,
        child: PageView.builder(
          pageSnapping: false,
          controller: _pageController,
          itemCount: peliculas.length,
          itemBuilder:(contex,i){
            return _tarjeta(context, peliculas[i]);
          } ,
          //children: _tarjetas(context)
        ),

    );

  }

  Widget _tarjeta(BuildContext context, Pelicula pelicula){
    final peliculaTarjeta = Container(        
        margin: EdgeInsets.only(right:15.0),
        child: Column(
          children: [
            Hero(
              tag: pelicula.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder:  AssetImage("assets/img/no-image.jpg"),
                  fit: BoxFit.cover,
                  height: 120,
                ),
              ),
            ),
            SizedBox(height: 5.0,),
            Text("${pelicula.originalTitle}",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      );
      

      return GestureDetector(        
        child:peliculaTarjeta,
        onTap: (){
          Navigator.pushNamed(context, "detalle",arguments: pelicula);
        },
      );




  }

  List<Widget> _tarjetas(BuildContext context) {
    
    return peliculas.map((pelicula){
      return Container(
        
        margin: EdgeInsets.only(right:15.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder:  AssetImage("assets/img/no-image.jpg"),
                fit: BoxFit.cover,
                height: 120,
              ),
            ),
            SizedBox(height: 5.0,),
            Text("${pelicula.originalTitle}",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      );
    }).toList();


  }
}