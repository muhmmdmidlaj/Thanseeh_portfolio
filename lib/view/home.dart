import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:protfolio/controller/homepageprovider.dart';
import 'package:protfolio/view/completed.dart';
import 'package:protfolio/view/get_in_tuch.dart';
import 'package:protfolio/view/onprogress.dart';
import 'package:protfolio/view/profile_screen.dart';
import 'package:protfolio/view/skill_carosal.dart';
import 'package:protfolio/view/upcoming.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Homepageprovider>(
      builder: (context, homepageprovider, child) => Sizer(
        builder: (context, orientation, deviceType) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: GradientText(
              '',
              colors: [
                Color.fromARGB(182, 0, 255, 251),
                Color.fromARGB(255, 0, 173, 211),
                Color.fromARGB(197, 55, 240, 203)
              ],
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.menu_sharp,
                  size: 33,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/panoramic-view-sunset-night.jpg'),
                  fit: BoxFit.cover),
              color: Color.fromARGB(95, 0, 0, 0),
            ),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 45,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.white),
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 64, 244, 118),
                              Color.fromARGB(255, 0, 255, 200),
                              Color.fromARGB(255, 118, 78, 149)
                            ])),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Welcome to my portfolio',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Hi! I'm Thanseeh ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        isRepeatingAnimation: true,
                        animatedTexts: [
                          TypewriterAnimatedText(
                            "Front end Developer",
                            speed: Duration(milliseconds: 100),
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 45,
                            ),
                          ),
                          TypewriterAnimatedText(
                            "Back end Developer",
                            speed: Duration(milliseconds: 100),
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 45,
                            ),
                          ),
                          TypewriterAnimatedText(
                            "Flutter Developer",
                            speed: Duration(milliseconds: 100),
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 45,
                            ),
                          ),
                          TypewriterAnimatedText(
                            "Node.js Developer",
                            speed: Duration(milliseconds: 100),
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 45,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Passionate about solving complex problems and building robust applications. My toolkit includes a range of technologies such as Flutter, Node.js, Dart, Firebase, Rest API, SQL, and Postman. I aspire to contribute to innovative projects, collaborate with cross-functional teams, and continuously enhance my skills. My goal is to create impactful solutions that improve user experiences and drive business success.',
                        style: TextStyle(
                          color: Color.fromARGB(119, 255, 255, 255),
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Center(child: Lottie.asset('asset/astrolegist.json')),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 24, 24, 24),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text(
                                'Skills',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 48,
                                  color: Color.fromARGB(255, 255, 254, 254),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Text(
                                  'Full Stack Flutter Developer, mastering Dart for frontend and Node.js for backend development. With a passion for crafting elegant user experiences.',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 144, 144, 144),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              CarouselScreen(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ProfileScreen(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(160, 27, 27, 27),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Projects',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'In my recent projects, I\'ve utilized Flutter, Dart, and Node.js to develop versatile mobile applications. With Flutter\'s cross-platform capabilities, I crafted visually appealing interfaces ensuring a seamless user experience on Android and iOS devices. Leveraging Dart\'s flexibility, I implemented efficient front-end logic and data handling. On the backend, Node.js enabled the creation of robust APIs. These applications demonstrate my expertise in modern app development technologies.',
                                  style: TextStyle(
                                    color: Color.fromARGB(142, 179, 167, 167),
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                width: double.infinity,
                                child: TabBar(
                                  
                                  controller: _tabController,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 69, 19, 103),
                                        Color.fromARGB(255, 51, 0, 220),
                                      ],
                                    ),
                                  ),
                                  indicatorColor: Colors.transparent,
                                  tabs: [
                                    Tab(
                                      child: Container(
                                        height: 55,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            bottomLeft: Radius.circular(30),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Completed',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Container(
                                        height: 55,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'On Progress',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Container(
                                        height: 55,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(30),
                                            topRight: Radius.circular(30),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Upcoming',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 270,
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    Compeled(),
                                    Onprogesscreen(),
                                    Upcoming(),
                                  ],
                                ),
                              ),
                              GetInTouchScreen(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
