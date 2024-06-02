import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../router/app_router.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child:
                      Image.asset('assets/background.png', fit: BoxFit.cover)),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color.fromRGBO(0, 0, 0, 0.5),
            ),
            if (constraints.maxHeight > 261)
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    const Text(
                      "Coffee Shop",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                    const Text(
                      "Feeling low? take a sip of coffee",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 2),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.offNamed(RoutesNames.home);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange),
                        child: const Text('Get Started'),
                      ),
                    )
                  ],
                ),
              )
          ],
        );
      },
    ));
  }
}
