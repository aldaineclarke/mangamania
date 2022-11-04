class Movie{
  final bool adult;
  final String backdrop_path;
  final Map<String, dynamic> belongs_to_collection;
  final int budget;
  final List<Map<String, dynamic>> genres;
  final String homepage;
  final int id;
  final String? imdb_id ;
  final String original_language;
  final String original_title;
  final String overview;
  final double popularity;
  final String poster_path;
  final List<Map<String, dynamic>> production_companies;
  final List<Map<String, dynamic>> production_countries;
  final String release_date;
  final int revenue;
  final int runtime;
  final List<Map<String, dynamic>> spoken_languages;
  final String status;
  final String title;
  final double vote_average;
  final int vote_count;
  final Map videos;

  Movie({
    this.adult = false,
    this.backdrop_path = "",
    this.belongs_to_collection = const {},
    this.budget = 0,
    this.genres = const [],
    this.homepage = "",
    this.id = 0,
    this.imdb_id ="",
    this.original_language="",
    this.original_title = "",
    this.overview = "",
    this.popularity= 0.0,
    this.poster_path = "",
    this.production_companies = const[],
    this.production_countries = const[],
    this.release_date = "",
    this.revenue = 0,
    this.runtime = 0,
    this.spoken_languages = const[],
    this.status = "",
    this.title = "",
    this.vote_average = 0.0,
    this.vote_count = 0,
    this.videos = const {},
});

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      adult: json["adult"],
      imdb_id: json["imdb_id"],
      backdrop_path: json["backdrop_path"],
      belongs_to_collection: json["belongs_to_collection"],
      budget: json["budget"],
      genres: json["genres"],
      homepage: json["homepage"],
      id: json["id"],
      original_language:json["original_language"],
      original_title: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"],
      poster_path: json["poster_path"],
      production_companies: json["production_companies"],
      production_countries: json["production_countries"],
      release_date: json["release_date"],
      revenue: json["revenue"],
      runtime: json["runtime"],
      spoken_languages: json["spoken_languages"],
      status: json["status"],
      title: json["title"],
      videos: json["videos"],
      vote_average: json["vote_average"],
      vote_count: json["vote_count"],

    );
  }
  factory Movie.shortFromJson(Map<String, dynamic> json){
    return Movie(
      adult: json["adult"],
      backdrop_path: json["backdrop_path"],
      id: json["id"],
      original_language:json["original_language"],
      original_title: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"],
      poster_path: json["poster_path"],
      release_date: json["release_date"],
      title: json["title"],
      vote_average: json["vote_average"],
      vote_count: json["vote_count"],

    );

  }
}

//Example of data that will be retrieved from the API

/*
{
    "adult": false,
    "backdrop_path": "/pGx6O6IwqADOsgmqWzPysmWnOyr.jpg",
    "belongs_to_collection": {
        "id": 732461,
        "name": "47 Ronin Collection",
        "poster_path": "/qg0ppX6dZBAcyiKQanNdLloTFo5.jpg",
        "backdrop_path": "/qPu2XyOSTN05bxoHRoMm6v8Ayy6.jpg"
    },
    "budget": 0,
    "genres": [
        {
            "id": 28,
            "name": "Action"
        },
        {
            "id": 14,
            "name": "Fantasy"
        }
    ],
    "homepage": "",
    "id": 732459,
    "imdb_id": "tt12610794",
    "original_language": "en",
    "original_title": "Blade of the 47 Ronin",
    "overview": "In this sequel to \"47 Ronin,\" a new class of warriors emerges among the Samurai clans to keep a sought-after sword from falling into the wrong hands.",
    "popularity": 2396.57,
    "poster_path": "/kjFDIlUCJkcpFxYKtE6OsGcAfQQ.jpg",
    "production_companies": [
        {
            "id": 17009,
            "logo_path": "/ssowAxOrrqsSR2CKeiytOXwLoCW.png",
            "name": "Universal 1440 Entertainment",
            "origin_country": "US"
        }
    ],
    "production_countries": [
        {
            "iso_3166_1": "US",
            "name": "United States of America"
        }
    ],
    "release_date": "2022-10-25",
    "revenue": 0,
    "runtime": 106,
    "spoken_languages": [
        {
            "english_name": "English",
            "iso_639_1": "en",
            "name": "English"
        }
    ],
    "status": "Released",
    "tagline": "",
    "title": "Blade of the 47 Ronin",
    "video": false,
    "vote_average": 7.265,
    "vote_count": 34,
    "videos": {
        "results": [
            {
                "iso_639_1": "en",
                "iso_3166_1": "US",
                "name": "Protecting the Blade Extended Preview",
                "key": "xAQJ7wwijuI",
                "site": "YouTube",
                "size": 1080,
                "type": "Clip",
                "official": true,
                "published_at": "2022-10-25T13:03:38.000Z",
                "id": "63586d611b70ae007ee756de"
            },
            {
                "iso_639_1": "en",
                "iso_3166_1": "US",
                "name": "Official Promo",
                "key": "xWN2iVRlqek",
                "site": "YouTube",
                "size": 1080,
                "type": "Trailer",
                "official": true,
                "published_at": "2022-10-18T19:50:38.000Z",
                "id": "634f0841076ce80091754df8"
            }
        ]
    }
}*/