import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF221F1E),
      body: Stack(
        children: [
          PageView(
            children: [
            _pageItem(image: "assets/images/onboarding1.png",text1: "Boost Productivity",text2: "Foc.io helps you boost your productivity on a differnet level"),
             _pageItem(image: "assets/images/onboarding2.png",text1: "Work Seamlessly",text2: "Get your work done seamlessly without interruption"),
             _pageItem(image: "assets/images/onboarding3.png",text1: "Achieve Higher Goals",text2: "By boosting your producivity we helpyou achieve higher goals"),
            ],
          )
        ],
      ),
    );
  }
}

Widget _pageItem({String? image,String? text1,String? text2}){
  return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image!),
              const SizedBox(
                height: 38,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  text1!,
                  style: TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  text2!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    
                      fontFamily: "Gilroy", fontSize: 14, color: Colors.white),
                ),
              )
            ],
          );
}
