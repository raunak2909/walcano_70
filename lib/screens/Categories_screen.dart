import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaperapp/Models/wallpaper_model.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key, required this.title, required this.image, required this.wallpaper});
    final String title;
    String? image;
    WallpaperModel? wallpaper;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 380,

                  child: Text(title,
                      style: GoogleFonts.roboto(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              Container(
                width: 400,
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  'Wallpapers available',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey
                  )
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 650,
                child: GestureDetector(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => wallpaperScreen(image:),));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
