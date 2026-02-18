import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;
  
  final List<Widget> _screens = [
    HomeScreen(),
    AddJobScreen(),
    StatsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Tracker'),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.work_outline),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: 'Add Jobs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined),
              label: 'Stats',
            ),
          ],
        ),
    );
  }
}

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(
          children: [
            const TabBar(
              labelStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold
              ),
              tabs: [
                Tab(icon: Icon(Icons.send), text: "Applied"),
                Tab(icon: Icon(Icons.videocam), text: "Interview"),
                Tab(icon: Icon(Icons.handshake), text: "Offered"),
                Tab(icon: Icon(Icons.cancel_outlined), text: "Rejected"),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text("Applied"),),
                  Center(child: Text("Interview"),),
                  Center(child: Text("Offered"),),
                  Center(child: Text("Rejected"),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddJobScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Add Job Screen'),
    );
  }
}

class StatsScreen extends StatelessWidget{
@override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Stats Screen'),
    );
  }
}



