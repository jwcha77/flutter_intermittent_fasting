import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intermittent_fasting/common/constants.dart';
import 'package:flutter_intermittent_fasting/pages/help_detail_screen.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HelpScreenTitle(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '※ Foods that you can eat during intermittent fasting',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        primary: false,
                        crossAxisCount: 4,
                        children: allowedFoods.map((e) {
                          return PhotoCard(allowedFood: e);
                        }).toList(),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        '※ Three things to observe to enhance the effects of intermittent fasting',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Accordion(
                        disableScrolling: true,
                        headerBorderColor: Colors.blueGrey,
                        headerBorderColorOpened: Colors.transparent,
                        headerBackgroundColorOpened: Colors.blue,
                        headerBackgroundColor: Colors.blueAccent,
                        contentBackgroundColor: Colors.white,
                        contentBorderColor: Colors.blueAccent,
                        contentBorderWidth: 3,
                        contentHorizontalPadding: 20,
                        scaleWhenAnimating: true,
                        openAndCloseAnimation: true,
                        headerPadding: const EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 15,
                        ),
                        paddingListTop: 8,
                        sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                        sectionClosingHapticFeedback: SectionHapticFeedback.light,
                        children: thingsToKeepInMind3.map((e) {
                          return AccordionSection(
                            contentVerticalPadding: 16,
                            leftIcon: const Icon(Icons.info_outline, color: Colors.white),
                            header: Text(
                              e.title,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            content: EasyRichText(
                              e.content,
                              patternList: [
                                EasyRichTextPattern(
                                  targetString: e.targetString,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      const Text(
                        '※ Frequently Asked Questions',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Accordion(
                        disableScrolling: true,
                        headerBorderColor: Colors.blueGrey,
                        headerBorderColorOpened: Colors.transparent,
                        headerBackgroundColorOpened: Colors.green,
                        headerBackgroundColor: Colors.lightGreen,
                        contentBackgroundColor: Colors.white,
                        contentBorderColor: Colors.lightGreen,
                        contentBorderWidth: 3,
                        contentHorizontalPadding: 20,
                        scaleWhenAnimating: true,
                        openAndCloseAnimation: true,
                        headerPadding: const EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 15,
                        ),
                        paddingListTop: 8,
                        sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                        sectionClosingHapticFeedback: SectionHapticFeedback.light,
                        children: frequentlyAskedQuestions.map((e) {
                          return AccordionSection(
                            contentVerticalPadding: 16,
                            leftIcon: const Icon(Icons.info_outline, color: Colors.white),
                            header: Text(
                              e.title,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            content: Text(e.content),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HelpScreenTitle extends StatelessWidget {
  const HelpScreenTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GradientText(
        'Help',
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

class PhotoCard extends StatelessWidget {
  const PhotoCard({
    super.key,
    required this.allowedFood,
  });

  final AllowedFood allowedFood;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Center(
        child: Hero(
          tag: allowedFood.image,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HelpDetailScreen(allowedFood: allowedFood),
                  ),
                );
              },
              child: FractionallySizedBox(
                heightFactor: 0.75,
                widthFactor: 0.75,
                child: Image.asset(allowedFood.image),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
