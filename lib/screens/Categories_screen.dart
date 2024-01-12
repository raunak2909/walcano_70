import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class natureCategories extends StatelessWidget {
  const natureCategories({super.key, required this.title, required this.list});
    final String title;
    final List<String> list;
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
                  '${list.length} Wallpapers available',
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
                    child: MasonryGridView.builder(
                      itemCount: list.length,
                      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child:
                                Image.network(list[index])),
                      ),
                    ),
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
