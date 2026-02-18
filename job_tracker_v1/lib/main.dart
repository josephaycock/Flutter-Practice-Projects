import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:job_tracker_v1/models/category_model.dart';

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

class HomeScreen extends StatefulWidget{

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories =[];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  void initState() {
    _getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _search(),
            SizedBox(height: 40,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Category',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  height: 150,
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: categories[index].boxColor,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }

  Container _search() {
    return Container(
            margin: EdgeInsets.only(top: 40, left: 20, right: 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Color(0xff8796BD).withOpacity(0.11),
                  blurRadius: 40,
                  spreadRadius: 0.0,
                )
              ]
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(15),
                hintText: 'Search jobs..',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Container(
                  width: 100,
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        VerticalDivider(
                          color: Colors.black,
                          indent: 10,
                          endIndent: 10,
                          thickness: 0.1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.filter_list),
                        ),
                      ],
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
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



