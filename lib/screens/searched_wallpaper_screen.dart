import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaperapp/Models/wallpaper_model.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperapp/screens/wallpaper_screen.dart';

class searchedWallpaper extends StatefulWidget {
   searchedWallpaper({super.key, required this.query, this.colorCode});
   String query;
   String? colorCode;

  @override
  State<searchedWallpaper> createState() => _searchedWallpaperState();
}

class _searchedWallpaperState extends State<searchedWallpaper> {
  var myKey = "fPEP48LlfqZj96ZoZswcg2yDm05Gm2Fj0tHgLvoAnO0DeNyhhSyvarJU";
  late Future<WallpaperModel> wallpaper;


  @override
  void initState() {
    super.initState();

    wallpaper = getWallpaper(widget.query.isNotEmpty ? widget.query : "car");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text(widget.query,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 55),),
              const SizedBox(height: 30,),
              Expanded(
                child: FutureBuilder(future: wallpaper,builder: (context,snapshot){
                  if(snapshot.hasData){
                    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 9/16, mainAxisSpacing: 10,crossAxisSpacing: 10),
                        itemCount: snapshot.data!.photos!.length,
                        itemBuilder: (_,index){
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => wallpaperScreen(image: snapshot.data!.photos![index].src!.portrait!),));
                        },
                        child: GridTile(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network('${snapshot.data!.photos![index].src!.portrait}', fit: BoxFit.fill,))),
                      );
                    });
                  }
                  else if(snapshot.hasError){
                    Center(child: Text(snapshot.hasError.toString()),);
                  }
                    return const Center(child: CircularProgressIndicator(),);
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<WallpaperModel> getWallpaper(String search)async{
    var url = "https://api.pexels.com/v1/search?query=$search&color=${widget.colorCode ?? ""}";
    var response = await http.get(Uri.parse(url),headers: {"Authorization": myKey});

    if(response.statusCode==200){
      var photos = jsonDecode(response.body);
      return WallpaperModel.fromJson(photos);
    }else{
      return WallpaperModel();

    }

  }
}
