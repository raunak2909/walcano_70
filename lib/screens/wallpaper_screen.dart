import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:wallpaper/wallpaper.dart';

class wallpaperScreen extends StatelessWidget {
  String image;

  wallpaperScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("${image}"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.info, size: 20, color: Colors.white,),

                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text('Info', style: TextStyle(
                        fontSize: 15, color: Colors.white),)
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        downloadWallpaper(context);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.download, size: 20, color: Colors.white,),

                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text('Save', style: TextStyle(
                        fontSize: 15, color: Colors.white),)
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        setWallpaper(context);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.brush_rounded, size: 20, color: Colors.white,),

                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text('Apply', style: TextStyle(
                        fontSize: 15, color: Colors.white),)
                  ],
                )
              ],
            ),
            SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }

  void downloadWallpaper(BuildContext context) {
    GallerySaver.saveImage(image).then((value) =>
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Wallpaper Downloaded!!'))));
  }

  void setWallpaper(BuildContext context){

    var downloadStream = Wallpaper.imageDownloadProgress(image);

    downloadStream.listen((event) {
      print("Progress: $event");
    }, onDone: () async{

     var check = await Wallpaper.homeScreen(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        options: RequestSizeOptions.RESIZE_FIT
      );

     print(check);

    }, onError: (e){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not set Wallpaper: $e')));
    });


  }
}
