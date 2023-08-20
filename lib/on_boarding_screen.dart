import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store/sign_screen.dart';

import 'intro_page_1.dart';
import 'intro_page_2.dart';
import 'intro_page_3.dart';
import 'intro_page_4.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  bool onFirstPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 3);
                onFirstPage = (index == 0);
              });
            },
            children: const [IntroPage1(), IntroPage2(), IntroPage3(), IntroPage4()],
          ),
          SafeArea(
            child: Container(
                // alignment: Alignment(0,0.6),
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  onFirstPage
                      ? const Text('')
                      : GestureDetector(
                          child: const Text(
                            'Back',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff797171)),
                          ),
                          onTap: () {
                            _controller.previousPage(
                                duration: const Duration(microseconds: 500),
                                curve: Curves.easeIn);
                          },
                        ),
                  onLastPage
                      ? GestureDetector(
                          child: const Text(
                            'Next',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff6CC51D),
                                fontWeight: FontWeight.w600),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SignScreen();
                                },
                              ),
                            );
                          },
                        )
                      : GestureDetector(
                          child: const Text(
                            'Next',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff6CC51D),
                                fontWeight: FontWeight.w600),
                          ),
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(microseconds: 500),
                                curve: Curves.easeIn);
                          },
                        ),
                ],
              ),
            )),
          ),
          Container(
            alignment: Alignment(0, 0.65),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: const SlideEffect(
                      spacing: 8.0,
                      radius: 4.0,
                      dotWidth: 9,
                      dotHeight: 8.0,
                      paintStyle: PaintingStyle.fill,
                      strokeWidth: 1.5,
                      dotColor: Color(0xff797171),
                      activeDotColor: Color(0xff6CC51D)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
