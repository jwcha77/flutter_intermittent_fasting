import 'package:flutter/material.dart';
import 'package:neonpen/neonpen.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CheckListScreen extends StatelessWidget {
  const CheckListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckListScreenTitle(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1. Suitable',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreen,
                        ),
                      ),
                      SizedBox(height: 8),
                      FirstCheckList(title: 'Overweight individuals'),
                      FirstCheckList(
                          title: 'Individuals with a goal of weight loss'),
                      SizedBox(height: 32),
                      Text(
                        '2. Suitable for 18 - 6 Intermittent Fasting under Medical Supervision',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      SizedBox(height: 8),
                      SecondCheckList(title: 'Individuals with diabetes'),
                      SecondCheckList(title: 'Individuals with hypertension'),
                      SecondCheckList(
                          title: 'Individuals with cardiovascular diseases'),
                      SizedBox(height: 32),
                      Text(
                        '3. Not Suitable',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                      SizedBox(height: 8),
                      ThirdCheckList(
                          title:
                              'Pregnant or nursing individuals, adolescents'),
                      ThirdCheckList(
                          title: 'Individuals in need of muscle gain'),
                      ThirdCheckList(
                          title:
                              'Individuals with high physical or work demands'),
                      ThirdCheckList(
                          title:
                              'Individuals with difficulties in appetite control, such as eating disorders'),
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

class CheckListScreenTitle extends StatelessWidget {
  const CheckListScreenTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GradientText(
        'Check List',
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

class FirstCheckList extends StatelessWidget {
  const FirstCheckList({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: CheckboxListTile(
        contentPadding: const EdgeInsets.only(right: 16),
        controlAffinity: ListTileControlAffinity.leading,
        title: Neonpen(
          text: Text(
            title,
            style: const TextStyle(fontSize: 15, height: 2.0),
          ),
          color: Colors.lightGreen,
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 15,
          ),
          opacity: 0.3,
        ),
        value: true,
        onChanged: (value) {},
      ),
    );
  }
}

class SecondCheckList extends StatelessWidget {
  const SecondCheckList({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: CheckboxListTile(
        contentPadding: const EdgeInsets.only(right: 16),
        controlAffinity: ListTileControlAffinity.leading,
        title: Neonpen(
          text: Text(
            title,
            style: const TextStyle(fontSize: 15, height: 2.0),
          ),
          color: Colors.orangeAccent,
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 15,
          ),
          opacity: 0.3,
        ),
        value: true,
        onChanged: (value) {},
      ),
    );
  }
}

class ThirdCheckList extends StatelessWidget {
  const ThirdCheckList({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: CheckboxListTile(
        contentPadding: const EdgeInsets.only(right: 16),
        controlAffinity: ListTileControlAffinity.leading,
        title: Neonpen(
          text: Text(
            title,
            style: const TextStyle(fontSize: 15, height: 2.0),
          ),
          color: Colors.redAccent,
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 15,
          ),
          opacity: 0.3,
        ),
        value: true,
        onChanged: (value) {},
      ),
    );
  }
}
