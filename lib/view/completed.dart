import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protfolio/controller/homepageprovider.dart';
import 'package:provider/provider.dart';

class Compeled extends StatelessWidget {
  const Compeled({super.key});

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
                _buildProjectContainer(
                  context: context,
                  homepageprovider: homepageprovider,
                  imagePath:
                      'asset/180670402-4b33d58c-fcb0-496c-a7b1-206b24a31d47.png',
                  projectName: 'Zomato-Clone',
                  onTap: homepageprovider.ontapfunction,
                  onHover: homepageprovider.ontapfunction,
                  isHovered: homepageprovider.istaped,
                  containerHeight: containerHeight,
                  containerWidth: containerWidth,
                  fontSizeTitle: fontSizeTitle,
                  fontSizeSubtitle: fontSizeSubtitle,
                ),
                _buildProjectContainer(
                  context: context,
                  homepageprovider: homepageprovider,
                  imagePath:
                      'asset/a6e5e5192802453.Y3JvcCwyNDI0LDE4OTYsMCww.jpg',
                  projectName: 'Phonepe-Clone',
                  onTap: homepageprovider.ontapfunction2,
                  onHover: homepageprovider.ontapfunction2,
                  isHovered: homepageprovider.istaped2,
                  containerHeight: containerHeight,
                  containerWidth: containerWidth,
                  fontSizeTitle: fontSizeTitle,
                  fontSizeSubtitle: fontSizeSubtitle,
                ),
                _buildProjectContainer(
                  context: context,
                  homepageprovider: homepageprovider,
                  imagePath:
                      'asset/07ea5040-c50a-4cc0-bf39-aa5187092351-cover.png',
                  projectName: 'Weather app-Clone',
                  onTap: homepageprovider.ontapfunction3,
                  onHover: homepageprovider.ontapfunction3,
                  isHovered: homepageprovider.istaped3,
                  containerHeight: containerHeight,
                  containerWidth: containerWidth,
                  fontSizeTitle: fontSizeTitle,
                  fontSizeSubtitle: fontSizeSubtitle,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProjectContainer({
    required BuildContext context,
    required Homepageprovider homepageprovider,
    required String imagePath,
    required String projectName,
    required Function onTap,
    required Function onHover,
    required bool isHovered,
    required double containerHeight,
    required double containerWidth,
    required double fontSizeTitle,
    required double fontSizeSubtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          InkWell(
            onHover: (value) {
              onHover();
            },
            onTap: () {
              onTap();
            },
            child: MouseRegion(
              onEnter: (event) {
                onHover();
              },
              onExit: (event) {
                homepageprovider.onExit();
              },
              child: Container(
                height: containerHeight,
                width: containerWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          isHovered
              ? Container(
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
                        projectName,
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
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
