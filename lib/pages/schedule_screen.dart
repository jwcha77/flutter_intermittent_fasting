import 'package:flutter/material.dart';
import 'package:flutter_intermittent_fasting/common/constants.dart';
import 'package:flutter_intermittent_fasting/common/enums.dart';
import 'package:flutter_intermittent_fasting/common/separated_row.dart';
import 'package:flutter_intermittent_fasting/common/utils.dart';
import 'package:flutter_intermittent_fasting/main.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> with AutomaticKeepAliveClientMixin {
  CountDownController controller = CountDownController();

  bool isStart = false;

  late int fastStartTime;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    fastStartTime = prefs.getInt(SharedPreferencesKey.fastStartTime.name) ?? 0;
    if (fastStartTime != 0) {
      DateTime now = DateTime.now();
      Duration timeDifference = now.difference(DateTime.fromMillisecondsSinceEpoch(fastStartTime));
      // Duration timeDifference = const Duration(hours: 15, minutes: 59, seconds: 59);
      fastStartTime = timeDifference.inSeconds;
      isStart = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    WidgetsBinding.instance.endOfFrame.then((_) {
      if (fastStartTime != 0) {
        controller.start();
        if (fastStartTime >= kHours16) {
          setState(() {
            claerFastStartTime();
            saveFastRecordTime();
            controller.reset();
            isStart = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('The fasting record is over.'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 1),
            ),
          );
        }
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScheduleScreenTitle(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Column(
                        children: [
                          WeekWidget(),
                          const SizedBox(height: 32),
                          if (isStart) ...[
                            Text(
                              'Start time : ${DateTime.now().toFullDateTimeString()}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ] else ...[
                            Text(
                              'Current time : ${DateTime.now().toFullDateTimeString()}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          const SizedBox(height: 32),
                          NeonCircularTimer(
                            onComplete: () {
                              setState(() {
                                claerFastStartTime();
                                saveFastRecordTime();
                                controller.reset();
                                isStart = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('The fasting record is over.'),
                                  backgroundColor: Colors.green,
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            width: constraints.maxWidth * 0.9,
                            controller: controller,
                            initialDuration: fastStartTime,
                            duration: kHours16,
                            isReverse: true,
                            strokeWidth: 10,
                            autoStart: false,
                            textFormat: TextFormat.HH_MM_SS,
                            backgroudColor: Colors.white,
                            neonColor: Colors.blue.shade900,
                            outerStrokeColor: Colors.grey.shade100,
                            innerFillGradient: LinearGradient(colors: [
                              Colors.greenAccent.shade200,
                              Colors.blueAccent.shade400,
                            ]),
                            neonGradient: LinearGradient(colors: [
                              Colors.greenAccent.shade200,
                              Colors.blueAccent.shade400,
                            ]),
                          ),
                          const SizedBox(height: 16),
                          if (isStart) ...[
                            SizedBox(
                              width: constraints.maxWidth / 2,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () async {
                                  var result = await showAdaptiveDialog<DialogAction>(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog.adaptive(
                                      title: const Text('To end the fast'),
                                      content: const Text(
                                        'I am currently fasting.\nWould you like to end the fast?',
                                        style: TextStyle(height: 1.5),
                                      ),
                                      actions: <Widget>[
                                        adaptiveAction(
                                          context: context,
                                          onPressed: () => Navigator.pop(
                                            context,
                                            DialogAction.cancel,
                                          ),
                                          child: const Text('Cancel'),
                                        ),
                                        adaptiveAction(
                                          context: context,
                                          onPressed: () => Navigator.pop(
                                            context,
                                            DialogAction.ok,
                                          ),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );

                                  if (!context.mounted) return;

                                  if (result == DialogAction.ok) {
                                    setState(() {
                                      claerFastStartTime();
                                      saveFastRecordTime();
                                      controller.reset();
                                      isStart = false;
                                    });

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('The fasting record is over.'),
                                        backgroundColor: Colors.red,
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                  }
                                },
                                child: const Text('End'),
                              ),
                            ),
                          ] else ...[
                            SizedBox(
                              width: constraints.maxWidth / 2,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    prefs.setInt(
                                        SharedPreferencesKey.fastStartTime.name, DateTime.now().millisecondsSinceEpoch);
                                    controller.start();
                                    isStart = true;
                                  });
                                },
                                child: const Text('Start'),
                              ),
                            ),
                          ],
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveFastRecordTime() {
    var elapsedTime = kHours16 - controller.getTimeInSeconds();
    var yearMonthDay = DateTime.now().toYearMonthDayString();
    var saveElapsedTime = prefs.getInt(yearMonthDay);
    if (saveElapsedTime == null || saveElapsedTime < elapsedTime) {
      prefs.setInt(yearMonthDay, elapsedTime);
    }
  }

  void claerFastStartTime() {
    prefs.remove(SharedPreferencesKey.fastStartTime.name);
    fastStartTime = 0;
  }
}

class ScheduleScreenTitle extends StatelessWidget {
  const ScheduleScreenTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GradientText(
        'Schedule',
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

class WeekWidget extends StatelessWidget {
  WeekWidget({
    super.key,
  });

  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));

    List<DateTime> thisWeekDates = [];

    for (var i = 0; i < 7; i++) {
      final date = startOfWeek.add(Duration(days: i));
      thisWeekDates.add(date);
    }

    return SizedBox(
      width: double.infinity,
      height: 100,
      child: SeparatedRow(
        children: thisWeekDates.mapWithIndex((date, index) {
          bool isToday = date.toYearMonthDayString() == DateTime.now().toYearMonthDayString();
          return Expanded(
            child: Container(
              decoration: (() {
                if (isToday) {
                  return BoxDecoration(border: Border.all(color: Colors.blue, width: 2));
                }
                if (index == 0) {
                  return const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 2, color: Colors.grey),
                      left: BorderSide(width: 2, color: Colors.grey),
                      bottom: BorderSide(width: 2, color: Colors.grey),
                    ),
                  );
                } else if (index == thisWeekDates.length - 1) {
                  return const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 2, color: Colors.grey),
                      right: BorderSide(width: 2, color: Colors.grey),
                      bottom: BorderSide(width: 2, color: Colors.grey),
                    ),
                  );
                } else {
                  return const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 2, color: Colors.grey),
                      bottom: BorderSide(width: 2, color: Colors.grey),
                    ),
                  );
                }
              }()),
              child: Column(
                children: [
                  Text(
                    date.toMonthDayString(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const Divider(height: 1),
                  Text(
                    WeekDay.values[index].toString(),
                    style: TextStyle(
                      fontSize: 16,
                      color: WeekDay.values[index].color,
                    ),
                  ),
                  const Divider(height: 1),
                  Expanded(
                    child: FractionallySizedBox(
                      widthFactor: 0.9,
                      heightFactor: 0.9,
                      child: FittedBox(
                        child: getIconWidget(date),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
        separatorBuilder: (context, index) {
          return const VerticalDivider(width: 1);
        },
      ),
    );
  }

  Icon getIconWidget(DateTime date) {
    var saveTime = prefs.getInt(date.toYearMonthDayString());
    if (saveTime == null) {
      return Icon(
        Sentiment.nothing.icon,
        color: Sentiment.nothing.color,
      );
    } else if (saveTime < kHours8) {
      return Icon(
        Sentiment.veryDissatisfied.icon,
        color: Sentiment.veryDissatisfied.color,
      );
    } else if (saveTime < kHours16) {
      return Icon(
        Sentiment.neutral.icon,
        color: Sentiment.neutral.color,
      );
    } else {
      return Icon(
        Sentiment.verySatisfied.icon,
        color: Sentiment.verySatisfied.color,
      );
    }
  }
}
