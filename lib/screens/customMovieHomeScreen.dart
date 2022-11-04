import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moviemania/services/network_handler.dart';
import 'package:moviemania/utilities/colors.dart';
import 'package:moviemania/utilities/functions.dart';
import 'package:moviemania/widgets/widgets.dart';

import '../models/customMovie.dart';
class CustomMovieHomeScreen extends StatefulWidget {
  const CustomMovieHomeScreen({Key? key}) : super(key: key);

  @override
  State<CustomMovieHomeScreen> createState() => _CustomMovieHomeScreenState();
}

class _CustomMovieHomeScreenState extends State<CustomMovieHomeScreen> {

  late Future<List<CustomMovie>> customMovies;

  Future<List<CustomMovie>> getCustomMovies() async{
    Map<String, dynamic> response = jsonDecode(await NetworkHandler.get(endpoint: "/movies"));
    List customMovies = response["data"];
    List<CustomMovie> newCustomMovieList = customMovies.map((movie){
      return CustomMovie.fromJson(movie);
    }).toList();
    return newCustomMovieList;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    customMovies = getCustomMovies();
  }

  @override
  Widget build(BuildContext context) {

    return PageWithDrawer(body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder<List<CustomMovie>>(
          future: customMovies,
          builder: (context, snapshot){
            if(snapshot.hasData){
              if(snapshot.data?.length == 0){
                return Center(
                    child:Container(
                        child: Text("No Movies were added to the database", style: TextStyle(fontSize: 20, color:AppColors.textColor),textAlign: TextAlign.center,)
                    )
                );
              }
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 5.0,
                    childAspectRatio: 1/1.65,

                  ),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index){
                        return Container(
                        height: 200,
                        child: Column(
                        children: [
                        Image(image: AssetImage("assets/movies_wallpaper.jpg"),height: MediaQuery.of(context).size.height * .18, width: double.infinity, fit: BoxFit.cover,),
                        Padding(
                        padding: const EdgeInsets.only(left:8.0,right:8.0, top: 4.0),
                        child: Text(textLimiter(text:"This is an image of one of the things I say", limit: 30), style: TextStyle(color:AppColors.titleColor, fontSize: 11,height: 1.2),textAlign: TextAlign.center,),
                        ),
                        ],
                        ),
                        );
                    }
              );

            }else{
              return CircularProgressIndicator();
            }
          },
        ),
      )

    ), floatingIconButton: FloatingActionButton(
      backgroundColor: AppColors.textColor,
      onPressed: (){
        Navigator.pushNamed(context, "/createCustomMovie");
      },
      child: Icon(Icons.add,),
      ),
    );
  }
}
