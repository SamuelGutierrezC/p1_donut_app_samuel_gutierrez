import 'package:flutter/material.dart';
import 'package:p1_donut_app_samuel_gutierrez/utils/my_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> myTabs = [
    // Donut tab
    const MyTab(iconPath: 'lib/icons/donut.png'),
    // Burger tab
    const MyTab(iconPath: 'lib/icons/burger.png'),
    // Smoothie tab
    const MyTab(iconPath: 'lib/icons/smoothie.png'),
    // Pancake tab
    const MyTab(iconPath: 'lib/icons/pancake.png'),
    // Pizza tab
    const MyTab(iconPath: 'lib/icons/pizza.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Icon(
              Icons.menu,
              color: Colors.grey[800],
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person),
            ),
          ],
        ),
        body: Column(
          children: [
            // Texto: "I want to"
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Text("I want to", style: TextStyle(fontSize: 24)),
                  Text(
                    "Eat",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
            ),
            // TabBar
            TabBar(
              tabs: myTabs,
            ),
          ],
        ),
      ),
    );
  }
}
