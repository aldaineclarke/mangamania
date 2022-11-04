import 'package:flutter/material.dart';
import 'package:moviemania/utilities/colors.dart';

class DrawerNavigation extends StatelessWidget {
  const DrawerNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: AppColors.primaryColor,
        child:Center(
            child: Column(


              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(backgroundImage: AssetImage("assets/Beauty-Beast-2017-Movie-Posters.webp"),),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          }
                          ,
                          child: Icon(Icons.close_outlined,size: 35.0,color: AppColors.titleColor)
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: ()=> Navigator.pushNamed(context, "/home"),
                        child: Text("Movies", style: setStyleIfActive(context, "/home")),
                      ),TextButton(
                        onPressed: ()=> Navigator.pushNamed(context, "/customMovie"),
                        child: Text("Custom Movies", style: setStyleIfActive(context, "/customMovie")),
                      ),TextButton(
                        onPressed: ()=> Navigator.pushNamed(context, "/favorite"),
                        child: Text("Favorites",style: setStyleIfActive(context, "/favorite")),
                      ),TextButton(
                        onPressed: ()=> Navigator.pushNamed(context, "/movie"),
                        child: Text("Movie Detail", style: setStyleIfActive(context, "/movie")),
                      ),TextButton(
                        onPressed: ()=> Navigator.pushNamed(context, "/profile"),
                        child: Text("Profile", style: setStyleIfActive(context, "/profile")),
                      ),TextButton(
                        onPressed: ()=> Navigator.pushNamed(context, "/settings"),
                        child: Text("Settings", style: setStyleIfActive(context, "/settings")),
                      ),TextButton(
                        onPressed: ()=> Navigator.pushNamed(context, "/login"),
                        child: Text("Logout", style: setStyleIfActive(context, "/login")),
                      ),
                    ],
                  ),
                )
              ],
            )
        )
    );
  }
}


bool isCurrentRoute(context, {String route = "/home"}){
  if(ModalRoute.of(context)!.settings.name == route){
    return true;
  }
  return false;
}

TextStyle setStyleIfActive(context, route){
  if(isCurrentRoute(context, route: route)){
    return TextStyle(color: AppColors.titleColor, fontSize: 20);
  }else{
    return Theme.of(context).textTheme.headline6!;
  }
}
