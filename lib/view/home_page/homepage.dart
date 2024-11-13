import 'package:fitness_app/view/home_page/tabs/bulktab.dart';
import 'package:fitness_app/view/home_page/tabs/cuttab.dart';
import 'package:fitness_app/view/home_page/tabs/maintenancetab.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> tabs = const [
    Tab(icon: Icon(Icons.directions_run), text: "Cardio"),
    Tab(icon: Icon(Icons.fitness_center), text: "Workout"),
    Tab(icon: Icon(Icons.bolt_rounded), text: "Strength training"),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sweat Now, Shine Later",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.electric_bolt,
              size: 18,
              color: Colors.blue,
            ),
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [Cuttab(), Bulktab(), Maintenancetab()],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}