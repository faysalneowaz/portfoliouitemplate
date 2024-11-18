import 'package:flutter/material.dart';
import 'package:learning/constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      height: screenSize.height,
      constraints: const BoxConstraints(maxHeight: 560.0),
      margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [
                  CustomColor.scaffoldBg.withOpacity(0.6),
                  CustomColor.scaffoldBg.withOpacity(0.6)
                ],
              ).createShader(bounds);
            },
            child: Image.asset(
              "assets/flutter_avater.png",
              width: screenWidth,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          const Text(
            "Hi,\nI'm Faysal Neowaz\nA Flutter Developer",
            style: TextStyle(
              fontSize: 24.0,
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          SizedBox(
            width: 190,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Get in Touch"),
            ),
          ),
        ],
      ),
    );
  }
}
