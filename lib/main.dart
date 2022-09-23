import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
          primarySwatch: Colors.indigo,
          fontFamily: "Poppins",
          dividerTheme: DividerThemeData(
            color: Color(0xFF2C3F7E),
            space: 30,
            thickness: 3.0
          )
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _primaryColor = Color(0xFF181F36);
  final _secondaryColor = Color.fromARGB(255, 109, 143, 255);
  final _textColor = const Color.fromARGB(255, 63, 84, 155);
  final _tertiaryColor = Color.fromARGB(255, 109, 143, 255);
  final _titleColor = Color(0xFFBACAFF);


  Widget createGenreBubble({String text = "new text",Color color = Colors.white}){
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: _textColor),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: _primaryColor,


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
                  backgroundColor: _primaryColor,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: const EdgeInsets.all(10.0),
                  minimumSize: const Size(20,20),
                ),

                child: Icon(Icons.arrow_back_ios_new_rounded,color: _secondaryColor, size: 20.0),
              ),
              ElevatedButton(
                onPressed: ()=> null ,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  backgroundColor: _primaryColor,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: const EdgeInsets.all(10.0),
                  minimumSize: const Size(20,20),
                ),

                child: Icon(Icons.edit,color: _secondaryColor, size: 20.0),
              ),
            ],
        ),

        ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Beauty-Beast-2017-Movie-Posters.webp"),
            fit: BoxFit.cover
          )
        ),
        child: ListView(
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
                          child: Text(
                            "Beauty and the Beast",
                            style: TextStyle(color: _titleColor, fontWeight: FontWeight.bold,fontSize: 28),
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
              color: _primaryColor,
            ),
            padding: const EdgeInsets.fromLTRB(20.0, 5.0 ,20.0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                  Row(

                    children: [
                      Text("Genre: ",
                        style: TextStyle(color: _textColor, fontSize: 16, ),

                      ),
                      Wrap(
                        spacing: 5.0,
                        runSpacing: 3.0,
                        children: [
                          createGenreBubble(text:"Fantasy", color:_textColor),
                          createGenreBubble(text:"Family", color:_textColor),
                          createGenreBubble(text:"Romance", color:_textColor),
                        ]
                      )
                    ],
                  ),
                  SizedBox(height: 5 ),
                  Row(
                    children: [
                      Text(
                        "Duration: ",
                        style: TextStyle(color: _textColor, ),
                      ),
                      Text(
                        "129min",
                        style: TextStyle(color:_textColor, ),
                      )
                    ],
                  ),
                  SizedBox(height: 5 ),
                  Row(

                    children: [
                      Text(
                        "Released: ",
                        style: TextStyle(color: _textColor, ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "2017",
                          style: TextStyle(color:_textColor, ),

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
                      style: TextStyle(color: _textColor, fontWeight: FontWeight.w600, fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                        "A selfish Prince is cursed to become a monster for the rest of his life, "
                        "unless he learns to fall in love with a beautiful young woman he keeps prisoner.",
                      style: TextStyle(color: _textColor, fontSize: 14)
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
                      style: TextStyle(color: _textColor, fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    Text(
                        "Kevin Kline, Luke Evans, Rita Davies, Rafaëlle Cohen, Ray Fearon",
                        style: TextStyle(color: _textColor, fontSize: 14)
                    )
                  ],
                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(

                            shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              // side:
                            ),
                            side: BorderSide( width: 2.0, color: _textColor, style: BorderStyle.solid),
                            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),

                          ),
                          onPressed: ()=> null,
                          child: Row(
                            children: [
                              Icon(Icons.play_arrow, color: _textColor,size: 32),
                              Text(
                                "Play Now",
                                style: TextStyle(fontSize: 12, color: _textColor, fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(

                            shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
                            backgroundColor:_textColor,

                          ),
                          onPressed: ()=> null,
                          child: Row(
                            children: [
                              Icon(Icons.play_arrow, color: _primaryColor, size: 32),
                              Text(
                                "Watch Trailer",
                                style: TextStyle(fontSize: 13, color: _primaryColor, fontWeight: FontWeight.bold),
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

      )
      )
    );
  }
}
