import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moviemania/utilities/colors.dart';
import 'package:moviemania/utilities/functions.dart';

import '../services/network_handler.dart';
class CustomMovieCreationScreen extends StatelessWidget {
  const CustomMovieCreationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.arrow_back),
        centerTitle: true,
        iconTheme: IconThemeData(color:AppColors.titleColor ),
        title: Text("Movie Creation Form", style: TextStyle(color:AppColors.titleColor),),
        elevation: 0,
      ),
      body: const Center(
        child:  MovieForm()
      ),
    );
  }
}


class MovieForm extends StatefulWidget {
  const MovieForm({Key? key}) : super(key: key);

  @override
  State<MovieForm> createState() => _MovieFormState();
}

class _MovieFormState extends State<MovieForm> {
      final titleController = TextEditingController();
      final descriptionController = TextEditingController();
      final genreController = TextEditingController();
      final release_dateController = TextEditingController();
      final video_urlController = TextEditingController();
      final ImagePicker imgPicker = ImagePicker();
      XFile? imgChosen;
      XFile? videoChosen;

      Map _requestState = {
        "hasError" : false,
        "message": "",
        "pending": false,
      };

      createMovie() async {
        try{
          setState(() {
            _requestState["pending"] = true;
          });
          Map<String, String> body = {
            "title": titleController.text,
            "description":descriptionController.text,
            "genre":genreController.text,
            "release_date":release_dateController.text,
          };
          List<Map<String, dynamic>> multipartArray =[{
            "field": "image",
            "data": imgChosen
          },{
            "field": "video_url",
            "data": videoChosen
          }];
          String responseString = await NetworkHandler.postMultipart("/movies", body, multipartArray);
          Map<String, dynamic> responseMap = jsonDecode(responseString);
          Navigator.of(context).pushNamed("/customMovie");

        }catch(error){
          print(error);
          setState(() {
            _requestState["pending"] = false;
            _requestState["hasError"] = true;
            _requestState["message"] = error.toString();
          });
        }
      }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Movie Title", style: TextStyle(color: AppColors.titleColor, fontSize: 16, fontWeight: FontWeight.bold),),
            TextFormField(
              controller: titleController,
              style: TextStyle(color:AppColors.titleColor),
              decoration: InputDecoration(
                errorText: (_requestState["hasError"] && !(_requestState["message"].toString().contains("password")))? _requestState["message"]: null,
                isDense: true,
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.titleColor, width:2)),
              ),
            ),
            SizedBox(height: 20),
            Text("Poster Image", style: TextStyle(color: AppColors.titleColor, fontSize: 16, fontWeight: FontWeight.bold),),
            Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor,
                  ),
                  onPressed: ()async{
                    var data = await imgPicker.pickImage(source: ImageSource.gallery,requestFullMetadata: true);
                    setState(() {

                      imgChosen = data;
                    });
                  },

                  child: Text("Upload Image", style:TextStyle(color: AppColors.primaryColor)),
                ),
                SizedBox(width: 5,),
                Text((imgChosen == null)? "": textLimiter(text:imgChosen!.name,limit:20), style: TextStyle(color:AppColors.titleColor),)
              ],
            ),

            SizedBox(height: 20),
            Text("Movie Trailer", style: TextStyle(color: AppColors.titleColor, fontSize: 16, fontWeight: FontWeight.bold),),
            Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor,
                  ),
                  onPressed: ()async{
                    var data = await imgPicker.pickVideo(source: ImageSource.gallery,maxDuration: Duration(minutes: 5));
                    setState(() {
                      videoChosen = data;
                    });
                  },

                  child: Text("Upload Video", style:TextStyle(color: AppColors.primaryColor)),
                ),
                SizedBox(width: 5,),
                Text((videoChosen == null)? "": textLimiter(text:videoChosen!.name,limit:20), style: TextStyle(color:AppColors.titleColor),)
              ],
            ),
            SizedBox(height: 20),
            Text("Release Date", style: TextStyle(color: AppColors.titleColor, fontSize: 16, fontWeight: FontWeight.bold),),
            TextFormField(
              controller: release_dateController,
              keyboardType: TextInputType.datetime,
              style: TextStyle(color:AppColors.titleColor),
              decoration: InputDecoration(
                errorText: (_requestState["hasError"] && !(_requestState["message"].toString().contains("password")))? _requestState["message"]: null,
                isDense: true,
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.titleColor, width:2)),
              ),
            ),
            SizedBox(height: 20),
            Text("Genres", style: TextStyle(color: AppColors.titleColor, fontSize: 16, fontWeight: FontWeight.bold),),
            TextFormField(
              controller: genreController,
              keyboardType: TextInputType.text,
              style: TextStyle(color:AppColors.titleColor),
              decoration: InputDecoration(
                errorText: (_requestState["hasError"] && !(_requestState["message"].toString().contains("password")))? _requestState["message"]: null,
                isDense: true,
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.titleColor, width:2)),
              ),
            ),
            SizedBox(height: 20),
            Text("Movie Description", style: TextStyle(color: AppColors.titleColor, fontSize: 16, fontWeight: FontWeight.bold),),
            TextFormField(
              controller: descriptionController,
              minLines: 3,
              maxLines: 4,
              keyboardType: TextInputType.multiline,
              style: TextStyle(color:AppColors.titleColor, ),
              decoration: InputDecoration(
                errorText: (_requestState["hasError"] && !(_requestState["message"].toString().contains("password")))? _requestState["message"]: null,
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.titleColor, width:2)),
              ),
            ),
            SizedBox(height: 40),

            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(double.infinity,40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                backgroundColor: AppColors.secondaryColor,
              ),
              onPressed: (){
                createMovie();
              },

              child: Text("Create Movie", style:TextStyle(color: AppColors.primaryColor)),
            ),

          ],
        ),
      ]
      ),
    );
  }
}

