import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double imageHeight = constraints.maxWidth < 600 ? 140 : 180;
        double imageWidth = constraints.maxWidth < 600 ? 130 : 170;
        double fontSizeName = constraints.maxWidth < 600 ? 16 : 20;
        double fontSizeTitle = constraints.maxWidth < 600 ? 14 : 17;
        double padding = constraints.maxWidth < 600 ? 8 : 10;
        double iconSize = constraints.maxWidth < 600 ? 20 : 30;
        double iconContainerSize = constraints.maxWidth < 600 ? 35 : 45;

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 24, 24, 24),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: constraints.maxWidth < 600
                      ? _buildProfileInfo(imageHeight, imageWidth, fontSizeName,
                          fontSizeTitle, padding)
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Container(
                                height: imageHeight,
                                width: imageWidth,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('asset/mee.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            _buildProfileTexts(
                                fontSizeName, fontSizeTitle, padding),
                          ],
                        ),
                ),
                SizedBox(height: constraints.maxWidth < 600 ? 20 : 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialIcon(
                      iconUrl: 'asset/insta.png',
                      link:
                          'https://www.instagram.com/thanseeh_km?igsh=MWJnd2sxYm1nbDhtNA%3D%3D&utm_source=qr',
                      size: iconSize,
                      containerSize: iconContainerSize,
                    ),
                    _buildSocialIcon(
                      iconUrl: 'asset/linkedIn_PNG 123.png',
                      link:
                          'http://www.linkedin.com/in/mohamed-thanseeh-881b47290',
                      size: iconSize,
                      containerSize: iconContainerSize,
                    ),
                    _buildSocialIcon(
                      iconUrl: 'asset/768px-Stack_Overflow_icon.svg.png',
                      link:
                          'https://stackoverflow.com/users/24638140/mohamed-thanseeh-km?tab=profile',
                      size: iconSize,
                      containerSize: iconContainerSize,
                    ),
                    _buildSocialIcon(
                      iconUrl: 'asset/GitHub-Symbooooo.png',
                      link: 'https://github.com/thanseehkm',
                      size: iconSize,
                      containerSize: iconContainerSize,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfileInfo(double imageHeight, double imageWidth,
      double fontSizeName, double fontSizeTitle, double padding) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: imageHeight,
            width: imageWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/mee.jpg'),
                fit: BoxFit.cover,
              ),
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          _buildProfileTexts(fontSizeName, fontSizeTitle, padding),
        ],
      ),
    );
  }

  Widget _buildProfileTexts(
      double fontSizeName, double fontSizeTitle, double padding) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(padding),
          child: Text(
            'Mohamed\nThanseeh km',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: fontSizeName,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: padding),
          child: Text(
            'App Developer',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: fontSizeTitle,
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () => launchUrl(Uri.parse('https://wa.link/fhc3qe')),
                child: Container(
                  height: 65,
                  width: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Color.fromARGB(76, 50, 33, 6),
                  ),
                  child: Center(
                    child: Text(
                      'Chat with \n     me',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => launchUrl(Uri.parse(
                  'https://github.com/thanseehkm/potfolio/blob/master/asset/Thanseeh_Resume.pdf')),
              child: Container(
                height: 65,
                width: 95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: const Color.fromARGB(76, 50, 33, 6),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Resume',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.file_download_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(
      {required String iconUrl,
      required String link,
      required double size,
      required double containerSize}) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(link)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: containerSize,
          width: containerSize,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Center(
            child: Image.asset(
              iconUrl,
              color: Colors.white,
              height: size,
              width: size,
            ),
          ),
        ),
      ),
    );
  }
}
