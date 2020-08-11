class Peliculas{
  List<Pelicula> items = new List<Pelicula>();

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList ){

    if (jsonList==null) return;
    
    for (var item in jsonList) {
      final pelicula = new Pelicula.fromJsonMap(item);
      this.items.add(pelicula);
    }   
  }

}

class Pelicula {
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Pelicula({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });


  Pelicula.fromJsonMap(Map<String, dynamic> json){

      popularity  =  json["popularity"]/1;
      voteCount  =   json["vote_count"];
      video  =       json["video"];
      posterPath  =  json["poster_path"];
      id   =          json["id"];
      adult  =       json["adult"];
      title         = json["title"];
      originalTitle =json["original_title"];
      genreIds      = json["genre_ids"].cast<int>();
      voteAverage   = json["vote_average"]/1;
      overview      = json["overview"];
      releaseDate   = json["release_date"];
      backdropPath  =json["backdrop_path"];
      originalLanguage  = json["original_language"];
  }


  getPosterImg(){
    if (posterPath==null){
      return "https://i1.wp.com/autohub.de/wp-content/uploads/2019/08/placeholder.png?fit=1200%2C800&ssl=1";
    }
    else{
    return "https://image.tmdb.org/t/p/w500/$posterPath";
    }
  }

  getBackgroundImg(){
    if (posterPath==null){
      return "https://i1.wp.com/autohub.de/wp-content/uploads/2019/08/placeholder.png?fit=1200%2C800&ssl=1";
    }
    else{
    return "https://image.tmdb.org/t/p/w500/$backdropPath";
    }
  }


}


