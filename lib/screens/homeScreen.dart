import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moviemania/models/movie.dart';
import 'package:moviemania/services/network_handler.dart';
import 'package:moviemania/utilities/colors.dart';
import 'package:moviemania/utilities/functions.dart';
import 'package:moviemania/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Map<String, List<Movie>>> TMDBMovies;

  Future<Map<String, List<Movie>>> getAllTMDBMovies() async{
    Map<String, dynamic> response = jsonDecode(await NetworkHandler.get(endpoint: "/tmdb_movies"));
    Map<String, dynamic> data = response["data"];
    Map<String, List<Movie>> movieLists = Map();
    data.forEach((key, value){
     List<Movie> movies = (value as List).map((e) => Movie.shortFromJson(e)).toList();
      movieLists.addAll({key:movies});
    });
    return movieLists;

  }

  @override
  void initState() {
    super.initState();
    TMDBMovies = getAllTMDBMovies();
  }
  @override
  Widget build(BuildContext context) {
    return PageWithDrawer(body: Center(child:Container(
        child: FutureBuilder<Map<String, List<Movie>>>(
          future: TMDBMovies,
          builder: (context, snapshot){
            if(snapshot.hasData){
              List<Movie> popularMovies = snapshot.data!["popular"]!;

              return ListView(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.32,
                    child: PageView.builder(
                        padEnds: false,
                        itemCount: popularMovies.length,
                        physics: BouncingScrollPhysics(),
                        controller: PageController(viewportFraction: 1),
                        itemBuilder: (context, index) {
                          return Stack(
                              fit: StackFit.expand,
                              children:[
                                ShaderMask(
                                  blendMode: BlendMode.hardLight,
                                  shaderCallback: (rect){
                                    return LinearGradient(
                                        colors: [AppColors.primaryColor,AppColors.primaryColor.withOpacity(0.7), Colors.transparent],
                                        begin: Alignment.bottomLeft, end:Alignment.topRight,
                                        tileMode: TileMode.mirror
                                    ).createShader(rect);
                                  },
                                  child: Image(
                                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress){
                                      if(loadingProgress == null) {return child;}
                                      return Container(
                                        decoration:  BoxDecoration(
                                            border: Border.all(color:Colors.indigo),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage("assets/loading_img.jpg")
                                            )
                                        ),
                                      );
                                    },

                                    image: NetworkImage(
                                      "https://image.tmdb.org/t/p/original/" +
                                          popularMovies[index].backdrop_path!),fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:[
                                        Text(textLimiter(text:popularMovies[index].title, limit:30), style: TextStyle(fontSize: 18, color: AppColors.titleColor, fontWeight: FontWeight.bold),),
                                        Text(textLimiter(text: popularMovies[index].overview, limit:120), style: TextStyle(fontSize: 12, color: AppColors.titleColor),),
                                        SizedBox(height :5),
                                        FittedBox(
                                          alignment: Alignment.center,
                                          child:CustomOutlineButton(background: AppColors.primaryColor,),


                                        )

                                      ]

                                  ),
                                )

                              ]

                          );

                        }
                    ),

                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: displayMoviesByGenres(context, snapshot.data!),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child:
                      Text("Copyright ${DateTime.now().year}",style: TextStyle(color:AppColors.textColor.withOpacity(0.5)),)

                  )
                ],
              );
            }else{
              return CircularProgressIndicator();
            }
          },
        )
    )),floatingIconButton: null,);
  }


}

List<Widget> displayMoviesByGenres(BuildContext context, Map<String, List<Movie>> movieData){

  List<Widget> widgets = [];
  movieData.forEach((key,  movies){
      if(key == "popular") return;
      widgets.add(Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child:Text(key.replaceFirst(key[0], key[0].toUpperCase()),
              style: TextStyle(color: AppColors.titleColor, fontWeight: FontWeight.w500, fontSize: 18),
          )));
      widgets.add(Container(
        height:MediaQuery.of(context).size.height * 0.22,
        child:ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width * 0.35,
                child: Image(
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress){
                    if(loadingProgress == null) {return child;}
                    return Container(
                        decoration:  BoxDecoration(
                          border: Border.all(color:Colors.indigo),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/loading_img.jpg")
                          )
                        ),

                    );
                  },
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/original/" +
                          movies[index].poster_path!), fit: BoxFit.contain)
              );
            }
        )
      ));
  });
  return widgets;
}


class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}




