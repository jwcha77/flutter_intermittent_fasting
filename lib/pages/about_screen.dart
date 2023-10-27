import 'package:flutter/material.dart';
import 'package:flutter_intermittent_fasting/common/constants.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AboutScreenTitle(),
            Expanded(
              child: IntroductionScreen(
                showDoneButton: false,
                showSkipButton: false,
                showNextButton: false,
                dotsDecorator: DotsDecorator(
                  size: const Size.square(10.0),
                  activeSize: const Size(20.0, 10.0),
                  activeColor: Colors.lightGreen,
                  color: Colors.black26,
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  spacing: const EdgeInsets.only(right: 6),
                ),
                pages: [
                  PageViewModel(
                    title: 'What is Intermittent Fasting?',
                    body:
                        'Intermittent fasting is a type of dietary approach that involves periodically alternating between eating and fasting to artificially regulate fasting periods beyond a certain level.',
                    image: Image.asset(
                      MyImages.intermittentFasting,
                      height: 175.0,
                    ),
                  ),
                  PageViewModel(
                    title: 'Inducing Rapid Ketosis',
                    body:
                        'Intermittent fasting extends meal intervals, reducing carbohydrate intake during fasting periods, which can lead to more effective fat burning and an increase in ketone levels. The rise in ketone levels can have a positive impact on energy supply and metabolism.',
                    image: Image.asset(
                      MyImages.intermittentFasting2,
                      height: 175.0,
                    ),
                  ),
                  PageViewModel(
                    title: 'Improved Insulin Sensitivity',
                    body:
                        'Intermittent fasting can stabilize blood sugar and improve insulin sensitivity, which can aid in the prevention and management of type 2 diabetes.',
                    image: Image.asset(
                      MyImages.intermittentFasting2,
                      height: 175.0,
                    ),
                  ),
                  PageViewModel(
                    title: 'Reduction in Fat Tissue',
                    body:
                        'Intermittent fasting can help reduce body fat and contribute to weight loss and a decrease in body fat percentage.',
                    image: Image.asset(
                      MyImages.intermittentFasting2,
                      height: 175.0,
                    ),
                  ),
                  PageViewModel(
                    title: 'Lifespan Extension through Gene Expression Changes',
                    body:
                        'According to some research, intermittent fasting can alter gene expression, which may be related to longevity. These changes may occur, especially during prolonged fasting.',
                    image: Image.asset(
                      MyImages.intermittentFasting2,
                      height: 175.0,
                    ),
                  ),
                  PageViewModel(
                    title: 'Autophagy-Induced Self-Cleansing Effect',
                    body:
                        'Intermittent fasting can promote autophagy, a process that removes unnecessary substances within cells, promoting cellular health, and aiding in cell regeneration and restoration.',
                    image: Image.asset(
                      MyImages.intermittentFasting2,
                      height: 175.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutScreenTitle extends StatelessWidget {
  const AboutScreenTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GradientText(
        'About',
        style: const TextStyle(
          fontSize: 30.0,
        ),
        colors: const [
          Colors.blue,
          Colors.red,
          Colors.green,
        ],
      ),
    );
  }
}
