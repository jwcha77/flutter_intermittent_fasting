import 'package:flutter/material.dart';
import 'package:flutter_intermittent_fasting/common/effectless_scroll_behavior.dart';
import 'package:flutter_intermittent_fasting/common/utils.dart';
import 'package:flutter_intermittent_fasting/pages/about_screen.dart';
import 'package:flutter_intermittent_fasting/pages/check_list_screen.dart';
import 'package:flutter_intermittent_fasting/pages/help_screen.dart';
import 'package:flutter_intermittent_fasting/pages/schedule_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intermittent Fasting',
      scrollBehavior: EffectlessScrollBehavior(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Intermittent Fasting'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            AboutScreen(),
            CheckListScreen(),
            ScheduleScreen(),
            HelpScreen(),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              pageController.jumpToPage(index);
              selectedIndex = index;
            });
          },
          destinations: appBarDestinations,
        ),
      ),
    );
  }
}

const List<NavigationDestination> appBarDestinations = [
  NavigationDestination(
    icon: Icon(Icons.info_outlined),
    selectedIcon: Icon(Icons.info),
    label: 'about',
  ),
  NavigationDestination(
    icon: Icon(Icons.list_outlined),
    selectedIcon: Icon(Icons.list),
    label: 'check list',
  ),
  NavigationDestination(
    icon: Icon(Icons.schedule_outlined),
    selectedIcon: Icon(Icons.schedule),
    label: 'schedule',
  ),
  NavigationDestination(
    icon: Icon(Icons.help_outline_outlined),
    selectedIcon: Icon(Icons.help_outlined),
    label: 'help',
  )
];
