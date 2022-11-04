class CustomMovie {
  final String title;
  final String description;
  final String image ;
  final String release_date ;
  final String video_url;
  final List<Map<String, dynamic>> genres;


  CustomMovie({
    this.title = "",
    this.description = "",
    this.image = "",
    this.release_date = "",
    this.video_url = "",
    this.genres = const []
  });

  factory CustomMovie.fromJson(Map<String, dynamic> json){
    return CustomMovie(
      title: json["title"],
      image: json["image"],
      genres: json["genres"],
      video_url: json["video_url"],
      release_date: json["release_date"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "title": this.title,
      "image": this.image,
      "genres": this.genres,
      "video_url": this.video_url,
      "release_date": this.release_date,
      "description": this.description
    };
  }
}
