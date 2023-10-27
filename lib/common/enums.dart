import 'package:flutter/material.dart';

enum WeekDay {
  monday('Mon', Colors.red),
  tuesday('Tue', Colors.orange),
  wednesday('Wed', Color.fromRGBO(251, 192, 45, 1)),
  thursday('Thu', Colors.green),
  friday('Fri', Colors.blue),
  saturday('Sat', Colors.indigo),
  sunday('Sun', Colors.purple);

  final String title;
  final Color color;

  const WeekDay(this.title, this.color);

  @override
  String toString() {
    return title;
  }
}

enum Sentiment{
  veryDissatisfied(Icons.sentiment_very_dissatisfied, Colors.red),
  neutral(Icons.sentiment_neutral, Colors.amber),
  verySatisfied(Icons.sentiment_very_satisfied, Colors.green),
  nothing(Icons.radio_button_off, Colors.grey);

  final IconData icon;
  final Color color;

  const Sentiment(this.icon, this.color);
}

enum DialogAction {
  ok,
  cancel
}

enum SharedPreferencesKey{
  fastStartTime
}
