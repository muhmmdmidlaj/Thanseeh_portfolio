import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protfolio/controller/homepageprovider.dart';
import 'package:provider/provider.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Homepageprovider>(
      builder: (context, homepageprovider, child) => LayoutBuilder(
        builder: (context, constraints) {
          double containerHeight = constraints.maxWidth < 600 ? 150 : 250;
          double containerWidth = constraints.maxWidth < 600 ? 200 : 350;
          double fontSizeTitle = constraints.maxWidth < 600 ? 20 : 30;
          double fontSizeSubtitle = constraints.maxWidth < 600 ? 12 : 18;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      InkWell(
                        onHover: (value) {
                          if (value) {
                            homepageprovider.ontapfunction2();
                          }
                        },
                        onTap: () {
                          homepageprovider.ontapfunction2();
                        },
                        child: Container(
                          height: containerHeight,
                          width: containerWidth,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('asset/imagessss.jpeg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      homepageprovider.istaped2
                          ? MouseRegion(
                              onEnter: (event) {
                                homepageprovider.ontapfunction2();
                              },
                              onExit: (event) {
                                homepageprovider.onExit();
                              },
                              child: Container(
                                height: containerHeight,
                                width: containerWidth,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(196, 0, 0, 0),
                                      Color.fromARGB(196, 33, 149, 243),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'medicat-Clone',
                                      style: GoogleFonts.jost(
                                        color: Colors.white,
                                        fontSize: fontSizeTitle,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'Flutter-project',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: fontSizeSubtitle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
