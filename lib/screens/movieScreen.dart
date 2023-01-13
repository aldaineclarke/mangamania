import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moviemania/models/movie.dart';
import 'package:moviemania/services/network_handler.dart';

import 'package:moviemania/utilities/colors.dart';
import 'package:moviemania/widgets/widgets.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  Widget createGenreBubble({String text = "new text",Color color = Colors.white}){
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: AppColors.textColor),
          borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0), right:Radius.circular(20.0))


      ),
      child: Text(
          text,
          style: TextStyle( fontSize: 10, color:color )
      ),
    );
  }

  Widget createRatingStars(){
    return Row(
        children:[
          Icon(Icons.star, color: Colors.amber),
          Icon(Icons.star, color: Colors.amber),
          Icon(Icons.star, color: Colors.amber),
          Icon(Icons.star, color: Colors.amber),
          Icon(Icons.star_half_outlined, color: Colors.amber),
        ]
    );
  }

  late Movie movie;
  late Future<Movie> movieData;
  Future<Movie> getMovieData(int movie_id)async{
    Map<String, dynamic> response = jsonDecode(await NetworkHandler.get(endpoint: "/tmdb_movies/$movie_id"));
    Map<String, dynamic> data = response["data"];
    return Movie.fromJson(data);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //The ModalRoute class below to get movie from route should not be called before the init method.
    // Usually this is called in the build method.
    movie = ModalRoute.of(context)!.settings.arguments as Movie;
    movieData = getMovieData(movie.id);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.primaryColor,


        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,

          title:Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton(
                onPressed: ()=> null ,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  backgroundColor: AppColors.primaryColor,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: const EdgeInsets.all(10.0),
                  minimumSize: const Size(20,20),
                ),

                child: Icon(Icons.arrow_back_ios_new_rounded,color: AppColors.secondaryColor, size: 20.0),
              ),
              ElevatedButton(
                onPressed: ()=> null ,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  backgroundColor: AppColors.primaryColor,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: const EdgeInsets.all(10.0),
                  minimumSize: const Size(20,20),
                ),

                child: Icon(Icons.edit,color: AppColors.secondaryColor, size: 20.0),
              ),
            ],
          ),

        ),
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:  NetworkImage(
                        "https://image.tmdb.org/t/p/original/" +
                            movie.poster_path!),
                    fit: BoxFit.cover
                )
            ),
            child: FutureBuilder(
              future: movieData,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return ListView(
                      children: [
                        //Image container of page
                        // Container(
                        //   height: (MediaQuery.of(context).size.height/2),
                        //   width:(MediaQuery.of(context).size.width),
                        //   decoration:const BoxDecoration(
                        //
                        //     image:  DecorationImage(
                        //       image: AssetImage("assets/Beauty-Beast-2017-Movie-Posters.webp"),
                        //       fit:BoxFit.cover,
                        //     ),
                        //   ),
                        //   child:
                        Container(
                            height: (MediaQuery.of(context).size.height/2),
                            width:(MediaQuery.of(context).size.width),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                                colors: <Color> [
                                  Colors.transparent,
                                  Color(0xFF181F36),
                                ],
                              ),
                            ),
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                                    child: Text(movie.title,
                                      style: TextStyle(color: AppColors.titleColor, fontWeight: FontWeight.bold,fontSize: 28),
                                      textAlign: TextAlign.start,


                                    )
                                ),

                              ],
                            )
                        ),
                        // ),

                        Container(
                          // color:Colors.red,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                            ),
                            padding: const EdgeInsets.fromLTRB(20.0, 5.0 ,20.0, 0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:[
                                  Row(

                                    children: [
                                      Text("Genre: ",
                                        style: TextStyle(color: AppColors.textColor, fontSize: 16, ),

                                      ),
                                      Wrap(
                                          spacing: 5.0,
                                          runSpacing: 3.0,
                                          children: movie.genres.map((id) => createGenreBubble(text:"$id", color:AppColors.textColor)).toList()
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5 ),
                                  Row(
                                    children: [
                                      Text(
                                        "Duration: ",
                                        style: TextStyle(color: AppColors.textColor, ),
                                      ),
                                      Text(
                                        "${movie.runtime}",
                                        style: TextStyle(color:AppColors.textColor, ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5 ),
                                  Row(

                                    children: [
                                      Text(
                                        "Released: ",
                                        style: TextStyle(color: AppColors.textColor, ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            "${movie.release_date}",
                                            style: TextStyle(color:AppColors.textColor, ),

                                          )
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      //generates a rating startComponent
                                      createRatingStars(),
                                      Icon(Icons.share, color: Colors.amber),
                                    ],
                                  ),
                                  Divider(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        "Plot",
                                        style: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w600, fontSize: 16),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                          movie.overview,
                                          style: TextStyle(color: AppColors.textColor, fontSize: 14)
                                      )
                                    ],
                                  ),
                                  Divider(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,

                                    children: [
                                      Text(
                                        "Cast",
                                        style: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w600, fontSize: 16),
                                      ),
                                      Text(
                                          "Kevin Kline, Luke Evans, Rita Davies, Rafaëlle Cohen, Ray Fearon",
                                          style: TextStyle(color: AppColors.textColor, fontSize: 14)
                                      )
                                    ],
                                  ),

                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 20.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomOutlineButton(),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(

                                              shape:RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30.0),
                                              ),
                                              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
                                              backgroundColor:AppColors.textColor,

                                            ),
                                            onPressed: ()=> null,
                                            child: Row(
                                              children: [
                                                Icon(Icons.play_arrow, color: AppColors.primaryColor, size: 32),
                                                Text(
                                                  "Watch Trailer",
                                                  style: TextStyle(fontSize: 13, color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                                                )
                                              ],
                                            )
                                        )
                                      ],
                                    ),
                                  )

                                ]
                            )
                        )
                      ]

                  );
                }else if(snapshot.hasError){
                  return Dialog(child: Text("${snapshot.error}"));
                }
                else{
                  return Center(child: CircularProgressIndicator());
                }
              }
            )
        )
    );
  }
}

