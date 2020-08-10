import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';


class MovieHorizontal extends StatelessWidget {
   final List<Pelicula> peliculas;
    

    MovieHorizontal({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
   final _screenZise= MediaQuery.of(context).size;
    return Container(

        height: _screenZise.height*0.2,
        child: PageView(
          pageSnapping: false,
          controller: PageController(
            initialPage: 1,
            viewportFraction: 0.26,
          ),
          children: _tarjetas(context),
        ),

    );

  }

  List<Widget> _tarjetas(BuildContext context) {
    final _screenZise= MediaQuery.of( context).size;
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