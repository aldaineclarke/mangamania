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
  late Future<List<Movie>> TMDBMovies;

  Future<List<Movie>> getAllTMDBMovies() async{
    Map<String, dynamic> response = jsonDecode(await NetworkHandler.get(endpoint: "/tmdb_movies"));
    List results = response["data"]["results"];
    List<Movie> movies = results.map((movie_data){
      return Movie.shortFromJson(movie_data);
    }).toList();
    return movies;
  }

  @override
  void initState() {
    super.initState();
    TMDBMovies = getAllTMDBMovies();
  }
  @override
  Widget build(BuildContext context) {
    return PageWithDrawer(body: Center(child:Container(
        child: FutureBuilder<List<Movie>>(
          future: TMDBMovies,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.32,
                    child: PageView.builder(
                        padEnds: false,
                        itemCount: 5,
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
                                  child: Image(image: NetworkImage(
                                      "https://image.tmdb.org/t/p/original/" +
                                          snapshot.data![index].backdrop_path!),fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:[
                                        Text(textLimiter(text:snapshot.data![index].title, limit:30), style: TextStyle(fontSize: 18, color: AppColors.titleColor, fontWeight: FontWeight.bold),),
                                        Text(textLimiter(text: snapshot.data![index].overview, limit:120), style: TextStyle(fontSize: 12, color: AppColors.titleColor),),
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
                  Container(
                      height: MediaQuery.of(context).size.height * 0.20,
                      child: Column(
                      children: [
                        Text("Comedies"),
                        Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: 5 ,
                              itemBuilder: (context, index){
                                return Container(
                                  width: MediaQuery.of(context).size.width * 0.28,

                                child:Image(image: NetworkImage("https://image.tmdb.org/t/p/original/" +
                                      snapshot.data![index].poster_path), fit: BoxFit.contain,),
                                );
                              }
                          ),
                        )
                      ],
                    )
                  )
                ],
              );
            }else{
              print(snapshot.hasError);
              print(snapshot.error);
              return CircularProgressIndicator();
            }
          },
        )
    )),floatingIconButton: null,);
  }


}




