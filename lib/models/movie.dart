class Movie{
  final int film_id;
  final int imdb_id;
  final String imdb_title_id;
  final String film_name;
  final List<Map<String, String>> release_dates;
  final List<Map<String, String>> age_rating;
  final String film_trailer;
  final String synopsis_long;
  final Map<String, Map> images;
  final Map<String, Map> still;

  Movie({
    this.film_id = 0,
    this.imdb_id = 0,
    this.imdb_title_id = "",
    this.film_name = "",
    this.release_dates = const[],
    this.age_rating = const[],
    this.film_trailer = "",
    this.synopsis_long = "",
    this.images = const{},
    this.still = const {}
});

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      film_id: json["film_id"],
      imdb_id: json["imdb_id"],
      imdb_title_id: json["imdb_title_id"],
      film_name: json["film_name"],
      release_dates: json["release_dates"],
      age_rating: json["age_rating"],
      film_trailer: json["film_name"],
      synopsis_long: json["synopsis_long"],
      images:json["images"],
      still: json["still"]

    );
  }

  Map<String, dynamic> toJSon(){
    Map<String, dynamic> data = {
      "film_id": this.film_id,
      "imdb_id": this.imdb_id,
      "imdb_title_id": this.imdb_title_id,
      "film_name": this.film_name,
      "release_dates": this.release_dates,
      "age_rating": this.age_rating,
      "film_trailer": this.film_name,
      "synopsis_long": this.synopsis_long,
      "images":this.images,
      "still": this.still
    };
    return data;
  }
}