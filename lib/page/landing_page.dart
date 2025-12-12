import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:selcom_business_landing/utils/icons_path.dart';

import '../utils/app_theme.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

// class _LandingPageState extends State<LandingPage> {
//   bool updatePositionOnScroll(ScrollNotification scrollNotification) {
//     // log(
//     //   "scrollNotification.metrics.pixels ===> ${scrollNotification.metrics.pixels}",
//     // );
//     return true;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SizedBox(
//         width: MediaQuery.sizeOf(context).width,
//         height: MediaQuery.sizeOf(context).height,
//         child: NotificationListener<ScrollNotification>(
//           onNotification: updatePositionOnScroll,

//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 MainSection(),
//                 FirstSection(),
//                 SecondSection(),
//                 ThirdSection(),
//                 FourthSection(),
//                 FifthSection(),
//                 FooterSection(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class _LandingPageState extends State<LandingPage> {
  final scrollOffset = ValueNotifier<double>(0);

  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.sizeOf(context).height;

    // final totalHeight = screenHeight * 6.7;
    final totalHeight = screenHeight * 3.33;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          MainSection(),
          NotificationListener<ScrollNotification>(
            onNotification: (n) {
              scrollOffset.value = n.metrics.pixels;
              return true;
            },
            child: ValueListenableBuilder(
              valueListenable: scrollOffset,
              builder: (_, offset, __) {
                return SingleChildScrollView(
                  child: SizedBox(
                    height: totalHeight,
                    child: Stack(
                      children: [
                        // buildSection(MainSection(), 0, offset),
                        buildSection(
                          FirstSection(),
                          screenHeight * 0.7,
                          offset,
                        ),
                        buildSection(
                          SecondSection(),
                          screenHeight * 1.7,
                          offset,
                        ),
                        buildSection(
                          ThirdSection(),
                          screenHeight * 2.7,
                          offset,
                        ),
                        buildSection(
                          FourthSection(),
                          screenHeight * 3.7,
                          offset,
                        ),
                        buildSection(
                          FifthSection(),
                          screenHeight * 4.7,
                          offset,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSection(Widget child, double originalTop, double offset) {
    // final top = max(originalTop - offset, 0);
    final top = max(originalTop - (offset * 1.3), 0); // faster parallax

    return Positioned(top: top.toDouble(), left: 0, right: 0, child: child);
  }
}

// class _LandingPageState extends State<LandingPage> {
//   final scrollOffset = ValueNotifier<double>(0);
//   late double screenHeight;

//   @override
//   Widget build(BuildContext context) {
//     screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           /// FIXED - DOES NOT SCROLL
//           SizedBox(height: screenHeight * 0.7, child: MainSection()),

//           /// SCROLLABLE CONTENT
//           NotificationListener<ScrollNotification>(
//             onNotification: (n) {
//               scrollOffset.value = n.metrics.pixels;
//               return true;
//             },
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   // SizedBox(height: screenHeight * 0.7), // space for MainSection
//                   ParallaxSection(
//                     child: FirstSection(),
//                     baseOffset: screenHeight * 0.7,
//                     scrollOffset: scrollOffset,
//                   ),

//                   ParallaxSection(
//                     child: SecondSection(),
//                     baseOffset: screenHeight * 1.7,
//                     scrollOffset: scrollOffset,
//                   ),

//                   ParallaxSection(
//                     child: ThirdSection(),
//                     baseOffset: screenHeight * 2.7,
//                     scrollOffset: scrollOffset,
//                   ),

//                   ParallaxSection(
//                     child: FourthSection(),
//                     baseOffset: screenHeight * 3.7,
//                     scrollOffset: scrollOffset,
//                   ),

//                   /// ⭐ Dynamic height supported (ExpansionTiles OK)
//                   ParallaxSection(
//                     child: FifthSection(),
//                     baseOffset: screenHeight * 4.7,
//                     scrollOffset: scrollOffset,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ParallaxSection extends StatelessWidget {
//   final Widget child;
//   final double baseOffset;
//   final ValueNotifier<double> scrollOffset;

//   const ParallaxSection({
//     required this.child,
//     required this.baseOffset,
//     required this.scrollOffset,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<double>(
//       valueListenable: scrollOffset,
//       builder: (_, offset, __) {
//         // final dy = max(baseOffset - (offset * 1.3), 0);
//         final dy = max(baseOffset - (offset * 3), 0);

//         return Transform.translate(
//           offset: Offset(0, dy.toDouble()),
//           child: child,
//         );
//       },
//     );
//   }
// }

class MainSection extends StatelessWidget {
  const MainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  appImages.selcomBusinessLogo,
                  height: MediaQuery.sizeOf(context).height * 0.075,
                ),
                Text(
                  "Boost your Online",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Stack(
                  children: [
                    Text(
                      "Banking Experience",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Styles.primaryRedColor,
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[Colors.white10, Styles.whiteColor],
                            stops: [0.0, 0.95],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.015),
                Text(
                  "Elevate your site’s visibility effortlessly with AI, where\nsmart technology meets user-friendly SEO tools.",
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontSize: 20, height: 1.5),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.125,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Styles.primaryRedColor,
                  ),
                  child: Text(
                    "Login now",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 16,
                      color: Styles.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FirstSection extends StatelessWidget {
  const FirstSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.sizeOf(context).height * 0.05,
          ),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: MediaQuery.sizeOf(context).height * 0.94,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                    image: AssetImage(appImages.section1),
                    fit: BoxFit.cover,
                    alignment: AlignmentGeometry.topCenter,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: MediaQuery.sizeOf(context).height * 0.95,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.8, 1],
                    colors: [Colors.white10, Styles.whiteColor],
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

class SecondSection extends StatelessWidget {
  const SecondSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.whiteColor,
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.9,
          height: MediaQuery.sizeOf(context).height * 0.9,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      appImages.selcomBusinessLogo,
                      height: MediaQuery.sizeOf(context).height * 0.05,
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
                    Text(
                      "Let’s Start Sending Your Money",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Styles.blackColor,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.0125,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Styles.lightThemeTertairyColor,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Lorem ipsum is a dummy or placeholder text commonly used in graphic",
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontSize: 16,
                                  color: Styles.lightGreyTextColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.0125,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Styles.lightThemeTertairyColor,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Lorem ipsum is a dummy or placeholder text commonly used in graphic",
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontSize: 16,
                                  color: Styles.lightGreyTextColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.0125,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Styles.lightThemeTertairyColor,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Lorem ipsum is a dummy or placeholder text commonly used in graphic",
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontSize: 16,
                                  color: Styles.lightGreyTextColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Styles.lightThemeTextFieldColor,
                  ),
                  child: Center(child: Image.asset(appImages.section2)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThirdSection extends StatelessWidget {
  const ThirdSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.whiteColor,
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.9,
          height: MediaQuery.sizeOf(context).height * 0.9,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      appImages.selcomBusinessLogo,
                      height: MediaQuery.sizeOf(context).height * 0.05,
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
                    Text(
                      "Higher Level Abstractions",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Styles.blackColor,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.0125,
                    ),
                    Text(
                      "Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development.",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        height: 1.3,
                        fontSize: 18,
                        color: Styles.lightGreyTextColor,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.0125,
                    ),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Styles.primaryRedColor),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Lorem ipsum is a dummy or placeholder text commonly used in graphic",
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontSize: 16,
                                  color: Styles.lightGreyTextColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Styles.primaryRedColor),

                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Lorem ipsum is a dummy or placeholder text commonly used in graphic",
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontSize: 16,
                                  color: Styles.lightGreyTextColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Styles.primaryRedColor),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Lorem ipsum is a dummy or placeholder text commonly used in graphic",
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontSize: 16,
                                  color: Styles.lightGreyTextColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Styles.lightThemeTextFieldColor,
                  ),
                  child: Center(child: Image.asset(appImages.section3)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FourthSection extends StatelessWidget {
  const FourthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.whiteColor,
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.9,
          height: MediaQuery.sizeOf(context).height * 0.9,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      appImages.selcomBusinessLogo,
                      height: MediaQuery.sizeOf(context).height * 0.05,
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
                    Text(
                      "Higher Level Abstractions",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Styles.whiteColor,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.0125,
                    ),
                    Text(
                      "Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development.",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        height: 1.3,
                        fontSize: 18,
                        color: Styles.lightGreyTextColor,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.0125,
                    ),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Styles.primaryRedColor),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Lorem ipsum is a dummy or placeholder text commonly used in graphic",
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontSize: 16,
                                  color: Styles.lightGreyTextColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Styles.primaryRedColor),

                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Lorem ipsum is a dummy or placeholder text commonly used in graphic",
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontSize: 16,
                                  color: Styles.lightGreyTextColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Styles.primaryRedColor),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Lorem ipsum is a dummy or placeholder text commonly used in graphic",
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontSize: 16,
                                  color: Styles.lightGreyTextColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Styles.lightThemeTextFieldColor,
                  ),
                  child: Center(child: Image.asset(appImages.section4)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FifthSection extends StatelessWidget {
  const FifthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.whiteColor,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.9,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.18,
                        height: MediaQuery.sizeOf(context).width * 0.18,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(appImages.section5),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.18,
                        height: MediaQuery.sizeOf(context).width * 0.18,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(appImages.section5),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.18,
                        height: MediaQuery.sizeOf(context).width * 0.18,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(appImages.section5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "Frequently\nAsked\nQuestions",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 50,
                          color: Styles.blackColor,
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
                    Expanded(
                      child: Column(
                        children: [
                          ExpansionTile(
                            tilePadding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 20,
                            ),
                            initiallyExpanded: true,
                            title: Text(
                              "Can I use the service for business transactions?",
                              style: TextStyle(fontSize: 25),
                            ),
                            childrenPadding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 20,
                            ),
                            children: [
                              Text(
                                "Yes, our platform supports both personal and business transactions. Businesses can benefit from our secure and efficient transfer options tailored to their needs.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Styles.lightGreyTextColor,
                                  fontSize: 18,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                          ExpansionTile(
                            tilePadding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 20,
                            ),
                            title: Text(
                              "What is the maximum amount I can transfer?",
                              style: TextStyle(fontSize: 25),
                            ),
                            childrenPadding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 20,
                            ),
                            children: [
                              Text(
                                "Yes, our platform supports both personal and business transactions. Businesses can benefit from our secure and efficient transfer options tailored to their needs.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Styles.lightGreyTextColor,
                                  fontSize: 18,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                          ExpansionTile(
                            tilePadding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 20,
                            ),
                            title: Text(
                              "Are there any benefits for frequent users?",
                              style: TextStyle(fontSize: 25),
                            ),
                            childrenPadding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 20,
                            ),
                            children: [
                              Text(
                                "Yes, our platform supports both personal and business transactions. Businesses can benefit from our secure and efficient transfer options tailored to their needs.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Styles.lightGreyTextColor,
                                  fontSize: 18,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                          ExpansionTile(
                            tilePadding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 20,
                            ),
                            title: Text(
                              "Can I access my account from multiple devices?",
                              style: TextStyle(fontSize: 25),
                            ),
                            childrenPadding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 20,
                            ),
                            children: [
                              Text(
                                "Yes, our platform supports both personal and business transactions. Businesses can benefit from our secure and efficient transfer options tailored to their needs.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Styles.lightGreyTextColor,
                                  fontSize: 18,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
              ],
            ),
          ),
          FooterSection(),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.5,
      width: MediaQuery.sizeOf(context).width,
      color: Styles.lightThemeTertairyColor,
      child: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      appImages.selcomBusinessLogo,
                      height: MediaQuery.sizeOf(context).height * 0.075,
                    ),
                    SizedBox(height: 20),
                    Text("Subscribe", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 10),
                    Text(
                      "Join our newsletter to stay up to date on features and releases.",
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.3,
                        color: Styles.lightGreyTextColor,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // disabledBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.transparent),
                        //   borderRadius: BorderRadius.circular(20),
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        hintText: "Enter your email",
                        hintStyle: Theme.of(context).textTheme.bodyMedium
                            ?.copyWith(color: Styles.lightGreyTextColor),
                        fillColor: Styles.whiteColor,
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: kTextTabBarHeight - 5,
                              width: kTextTabBarHeight - 5,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Styles.lightThemeTertairyColor,
                              ),
                              child: Icon(Icons.mail),
                            ),
                          ],
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: kTextTabBarHeight,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Styles.blackColor,
                              ),
                              child: Center(
                                child: Text(
                                  "Subscribe",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Styles.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "By subscribing you agree to with our Privacy Policy",
                      style: TextStyle(
                        fontSize: 12,
                        color: Styles.lightGreyTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  spacing: 20,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Quick Links", style: TextStyle(fontSize: 14)),
                        SizedBox(height: 10),
                        Text(
                          "Home",
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.3,
                            color: Styles.lightGreyTextColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "About",
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.3,
                            color: Styles.lightGreyTextColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Services",
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.3,
                            color: Styles.lightGreyTextColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Contact",
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.3,
                            color: Styles.lightGreyTextColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Quick Links", style: TextStyle(fontSize: 14)),
                        SizedBox(height: 10),
                        Text(
                          "Home",
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.3,
                            color: Styles.lightGreyTextColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "About",
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.3,
                            color: Styles.lightGreyTextColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Services",
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.3,
                            color: Styles.lightGreyTextColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Contact",
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.3,
                            color: Styles.lightGreyTextColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Quick Links", style: TextStyle(fontSize: 14)),
                        SizedBox(height: 10),
                        Text(
                          "Home",
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.3,
                            color: Styles.lightGreyTextColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "About",
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.3,
                            color: Styles.lightGreyTextColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Services",
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.3,
                            color: Styles.lightGreyTextColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Contact",
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.3,
                            color: Styles.lightGreyTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
