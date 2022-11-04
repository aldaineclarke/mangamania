import 'package:flutter/material.dart';
import 'package:moviemania/utilities/colors.dart';
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
      final imageController = TextEditingController();
      final release_dateController = TextEditingController();
      final video_urlController = TextEditingController();


      Map _requestState = {
        "hasError" : false,
        "message": "",
        "pending": false,
      };
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
            Text("Image url", style: TextStyle(color: AppColors.titleColor, fontSize: 16, fontWeight: FontWeight.bold),),
            TextFormField(

              controller: imageController,
              keyboardType: TextInputType.url,
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
            SizedBox(height: 20),
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

          ],
        ),
      ]
      ),
    );
  }
}

