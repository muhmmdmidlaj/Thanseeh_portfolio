import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CarouselScreen extends StatelessWidget {
  final CarouselController controller = CarouselController();
  final CarouselController controllerTwo = CarouselController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double carouselHeight = constraints.maxWidth < 600 ? 100 : 120;
        double carouselWidth = constraints.maxWidth < 600 ? 90 : 110;
        double containerHeight = constraints.maxWidth < 600 ? 95 : 115;
        double containerWidth = constraints.maxWidth < 600 ? 80 : 100;

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => controller.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear,
                  ),
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
                SizedBox(
                  height: carouselHeight,
                  width: carouselWidth,
                  child: CarouselSlider(
                    carouselController: controller,
                    items: [
                      Container(
                        child: Lottie.asset('asset/Animation - 1713770337120.json'),
                        height: containerHeight,
                        width: containerWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                      ),
                      Container(
                        child: Lottie.asset('asset/Animation - 1713770087896.json'),
                        height: containerHeight,
                        width: containerWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                      ),
                      Container(
                        child: Lottie.asset('asset/Animation - 1713765180685.json'),
                        height: containerHeight,
                        width: containerWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      autoPlay: true,
                      initialPage: 2,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      aspectRatio: 2,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear,
                  ),
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => controllerTwo.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear,
                  ),
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
                SizedBox(
                  height: carouselHeight,
                  width: carouselWidth,
                  child: CarouselSlider(
                    carouselController: controllerTwo,
                    items: [
                      Container(
                        child: Lottie.asset('asset/Animation - 1713770853873.json'),
                        height: containerHeight,
                        width: containerWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                      ),
                      Container(
                        child: Lottie.asset('asset/Animation - 1713771080464.json'),
                        height: containerHeight,
                        width: containerWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                      ),
                      Container(
                        height: containerHeight,
                        width: containerWidth,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('asset/62cc1b51150d5de9a3dad5f8.png'),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      autoPlay: true,
                      initialPage: 2,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      aspectRatio: 2,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => controllerTwo.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear,
                  ),
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
