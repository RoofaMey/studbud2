import 'package:flutter/material.dart';
import 'weather_page.dart';
import 'studyplanner_page.dart';
import 'profile_page.dart';
import 'diary_page.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
 static const String id ='HomePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STUDBUD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PixelifySans',
        scaffoldBackgroundColor: const Color(0xFFF4F4F4),
      ),
      home: const HomepageScreen(),
    );
  }
}

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          // Avatar & Greeting
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(50),
              child: Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(Icons.pets, size: 40, color: Colors.black),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Hello, Ruffa! Ready to study or get ready for school?",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Weather & Location
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.wb_sunny_outlined),
                        SizedBox(width: 8),
                        Text("Sunny Day"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.white),
                        SizedBox(width: 8),
                        Text("Capas, Tarlac",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Action Buttons & Quote
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      _blackButton("Plan your studies", Icons.edit_calendar),
                      _blackButton("Check weather", Icons.cloud),
                      _blackButton("Write your thoughts", Icons.create),
                      _blackButton("11:11 AM | do best", Icons.access_time),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "“Not to brag but to inspire.”",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        Icon(Icons.pets, size: 40),
                        Text(
                          "“Hard work pays off so do your best!!”",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Footer Message
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Small steps every day lead to big changes.",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    ),
    const DiaryPage(),
    const WeatherPage(),
    const StudyPlannerPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'STUDBUD ✦',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(Icons.add, color: Colors.white),
          SizedBox(width: 10),
          Icon(Icons.more_vert, color: Colors.white),
          SizedBox(width: 10),
        ],
        toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),

      // Body displays the selected page
      body: pages[selectedIndex],

      // ✅ Custom circular Bottom Nav Bar
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _navItem(Icons.home, 0),
            _navItem(Icons.note, 1),
            _navItem(Icons.cloud, 2),
            _navItem(Icons.list, 3),
            _navItem(Icons.person, 4),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey[400],
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 24,
          color: isSelected ? Colors.black : Colors.white,
        ),
      ),
    );
  }

  static Widget _blackButton(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(label, style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
