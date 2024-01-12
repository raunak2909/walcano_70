import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class wallpaperScreen extends StatelessWidget {
  String? image;
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
                    Text('Info', style: GoogleFonts.montserrat(fontSize: 15, color: Colors.white),)
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.download, size: 20, color: Colors.white,),

                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text('Save', style: GoogleFonts.montserrat(fontSize: 15, color: Colors.white),)
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.brush_rounded, size: 20, color: Colors.white,),

                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text('Apply', style: GoogleFonts.montserrat(fontSize: 15, color: Colors.white),)
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
}
