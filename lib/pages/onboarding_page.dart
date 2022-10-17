import 'package:flutter/material.dart';

import 'home_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController? pageController = PageController();
 int? hozirgiIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF221F1E),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                hozirgiIndex = index;
              });
            },
            children: [
              _pageItem(
                  image: "assets/images/onboarding1.png",
                  text1: "Boost Productivity",
                  text2:
                      "Foc.io helps you boost your productivity on a differnet level"),
              _pageItem(
                  image: "assets/images/onboarding2.png",
                  text1: "Work Seamlessly",
                  text2: "Get your work done seamlessly without interruption"),
              _pageItem(
                  image: "assets/images/onboarding3.png",
                  text1: "Achieve Higher Goals",
                  text2:
                      "By boosting your producivity we helpyou achieve higher goals"),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 54,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                        Color(0xFFEF895F),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                     if(hozirgiIndex==2){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>HomePage()));
                     }else{
                      pageController!.nextPage(duration: Duration(seconds: 1), curve: Curves.linear);
                     }
                    },
                    child:  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        hozirgiIndex!=2?"Next":"Get started",
                        style: TextStyle(fontFamily: "Raleway", fontSize: 16),
                      ),
                    ),
                  ),
                ),
                 SizedBox(height: 20,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _indicatorBuilder(hozirgiIndex!),
                 )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _pageItem(
    {required String? image, required String? text1, required String? text2}) {
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
          style: const TextStyle(
              fontFamily: "Gilroy",
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.w400),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          text2!,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontFamily: "Gilroy", fontSize: 14, color: Colors.white),
        ),
      ),
    ],
  );
}

Widget _indicatorItem(bool isActive){
  return AnimatedContainer(
    duration: Duration(milliseconds: 700),
    margin: EdgeInsets.all(5),
    width: isActive ? 26 : 8,
    height: 8,
    decoration: BoxDecoration(
      color: isActive? Colors.white : Colors.grey,
      borderRadius: BorderRadius.circular(25)
    ),
  );
}

List<Widget> _indicatorBuilder(int hozirgiIndex){
  List<Widget> list = [];
  for(int i=0;i<3;i++){
    if(hozirgiIndex == i){
      list.add(_indicatorItem(true));
    }else{
      list.add(_indicatorItem(false));
    }
  }
  return list;
}
