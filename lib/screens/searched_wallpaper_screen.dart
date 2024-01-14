import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaperapp/Models/wallpaper_model.dart';
import 'package:http/http.dart' as http;

class searchedWallpaper extends StatefulWidget {
   searchedWallpaper({super.key, required this.image, required this.text});
   String text;
  String image;

  @override
  State<searchedWallpaper> createState() => _searchedWallpaperState();
}

class _searchedWallpaperState extends State<searchedWallpaper> {
  var myKey = "fPEP48LlfqZj96ZoZswcg2yDm05Gm2Fj0tHgLvoAnO0DeNyhhSyvarJU";
  late Future<WallpaperModel> wallpaper;


  @override
  void initState() {
    super.initState();

    wallpaper = getWallpaper('');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              Text("${widget.text}",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 55),),
              SizedBox(height: 30,),
              FutureBuilder(future: wallpaper,builder: (context,snapshot){
                if(snapshot.hasData){
                  return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (_,index){
                    return GridTile(child: Image.network('${widget.image}'));
                  });
                }
                else if(snapshot.hasError){
                  Center(child: Text('${snapshot.hasError.toString()}'),);
                }
                  return Center(child: CircularProgressIndicator(),);
              })
            ],
          ),
        ),
      ),
    );
  }
  Future<WallpaperModel> getWallpaper(String search)async{
    var url = "https://api.pexels.com/v1/search?query=$search";
    var response = await http.get(Uri.parse(url),headers: {"Authorization": myKey});

    if(response.statusCode==200){
      var photos = jsonDecode(response.body);
      return WallpaperModel.fromJson(photos);
    }else{
      return WallpaperModel();
    }
  }
}
