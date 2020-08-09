import 'package:flutter/material.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart'; 

class HomePage extends StatelessWidget {
 

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
           children: [
             _swiperTarjetas(),
           ],
         ),
        ),
    );
  }

  Widget _swiperTarjetas() {
    return CardSwiper(
      peliculas: [1,2.3,4,5],
    );
  }
}