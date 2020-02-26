import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:ti_boulo/constants.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Work",
          body: "Get paid for your valuable skills by working on projects.",
          image: Image.asset('assets/images/painter.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Hire",
          body: "Hire freelancers to work on your projects.",
          image: Image.asset('assets/images/hire.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Manage",
          body: "Manage the money you earn.",
          image: Image.asset('assets/images/manage.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () {
        Navigator.pushReplacementNamed(context, '/home');
      },
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text(
        'Skip',
        style: TextStyle(color: kMainColor),
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: kMainColor,
      ),
      done: const Text('Done',
          style: TextStyle(fontWeight: FontWeight.w600, color: kMainColor)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.black26,
        activeSize: Size(22.0, 10.0),
        activeColor: kMainColor,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
