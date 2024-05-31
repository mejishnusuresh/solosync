import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroSlider extends StatefulWidget {
  const IntroSlider({super.key});

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  @override
  Widget build(BuildContext context) {

    List<PageViewModel> pages = [
      PageViewModel(
        title: "Screen 1",
        body: "Screen 1",
        image: Image.asset("assets/icons/tasks.png"),
      ),
      PageViewModel(
        title: "Screen 2",
        body: "Screen 2",
        image: Image.asset("assets/icons/tasks.png"),
      ),
      PageViewModel(
        title: "Screen 3",
        body: "Screen 3",
        image: Image.asset("assets/icons/tasks.png"),
      )
    ];
    return Scaffold(
        body: IntroductionScreen(
          pages: pages,
          skip: const Text("Skip"),
          next: const Text("Next"),
          done: const Text("Done"),
          onDone: (){},
        )
    );
  }
}
