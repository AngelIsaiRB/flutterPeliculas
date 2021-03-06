// Generated by https://quicktype.io


class Cast{

  List<Actor> actorers = new List<Actor>();

  Cast.fromJsonList(List<dynamic> jsonList ){

    if(jsonList ==  null )
      return ;

    for (var item in jsonList) {
      final ctor = new Actor.fromJsonMap(item);
      this.actorers.add(ctor);      
    }


  }


}

class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });


  Actor.fromJsonMap(Map<String,dynamic> json){

this.castId       = json["cast_id"];
this.character    = json["character"];
this.creditId     = json["credit_id"];
this.gender       = json["gender"];
this.id           = json["id"];
this.name         = json["name"];
this.order        = json["order"];
this.profilePath  = json["profile_path"];
    
  }
getfoto(){
    if (profilePath==null){
      return "https://i1.wp.com/autohub.de/wp-content/uploads/2019/08/placeholder.png?fit=1200%2C800&ssl=1";
    }
    else{
    return "https://image.tmdb.org/t/p/w500/$profilePath";
    }
  }


}

