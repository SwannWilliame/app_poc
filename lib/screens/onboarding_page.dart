import 'package:app_for_poc/reuse_func/build_page.dart';
import 'package:app_for_poc/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 4);
          },
          children: [
            BuildPage(
              color: Color.fromARGB(255, 211, 232, 210),
              titleColor: Colors.teal.shade700,
              textColor: Colors.grey.shade900,
              title: "TITRE 1",
              imageName: "nature1",
              text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
            ),
            BuildPage(
              title: "TITRE 2", 
              text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", 
              imageName: "projections",
              color: Colors.lightBlue,
              titleColor: Colors.white,
              textColor: Colors.grey.shade900,
              ),
            BuildPage(
              title: "TITRE 3", 
              text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", 
              imageName: "complete",
              color: Color.fromARGB(255, 58, 15, 49),
              titleColor: Colors.grey.shade500,
              textColor: Colors.white,
              ),
            BuildPage(
              title: "TITRE 4", 
              text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", 
              imageName: "search_app",
              color: Color.fromARGB(255, 254, 99, 0),
              titleColor: Colors.grey.shade500,
              textColor: Colors.white,
              ),
            BuildPage(
              title: "TITRE 5", 
              text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", 
              imageName: "idea",
              color: Color.fromARGB(255, 205, 178, 96),
              titleColor: Colors.grey.shade800,
              textColor: Colors.white,
              ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 80,
        child: isLastPage ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: SmoothPageIndicator(
                controller: controller, 
                count: 5,
                effect: WormEffect(
                  activeDotColor: Colors.grey.shade900,
                ),
                onDotClicked: (index) => controller.animateToPage(index, duration: const Duration(milliseconds:500 ), curve: Curves.easeInOut) ,
              ),
            ),
            TextButton(
              onPressed: () async{ 
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);

                Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => WidgetTree(),)
                );
              },
              child: Text("GET STARTED", style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 21,
                  fontWeight: FontWeight.bold
                ),),
            )
          ],
        )
        : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed:() => controller.animateToPage(2, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut),
              child: Text(
                "SKIP",
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 21,
                  fontWeight: FontWeight.bold
                ),
                ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller, 
                count: 5,
                effect: WormEffect(
                  activeDotColor: Colors.grey.shade900,
                ),
                onDotClicked: (index) => controller.animateToPage(index, duration: const Duration(milliseconds:500 ), curve: Curves.easeInOut) ,
              ),
            ),
            TextButton(
              onPressed: () => controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut),
              child: Text("NEXT", style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 21,
                  fontWeight: FontWeight.bold
                ),),
            )
          ],
        ),
      ),
    );
  }
}