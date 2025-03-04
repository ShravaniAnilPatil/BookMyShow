import 'package:flutter/material.dart';
import 'details.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedMood = "Happy";

  final Map<String, List<Map<String, String>>> moodMovies = {
    "Happy": [
      {"image": "assets/movie1.jpg", "tag": "PROMOTED"},
      {"image": "assets/movie2.jpg", "tag": ""}
    ],
    "Sad": [
      {"image": "assets/movie3.jpg", "tag": ""},
      {"image": "assets/movie4.png", "tag": "NEW"}
    ],
    "Excited": [
      {"image": "assets/movie5.png", "tag": "HOT"},
      {"image": "assets/movie6.png", "tag": ""}
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Guest!'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.qr_code), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text("Navi Mumbai", style: TextStyle(color: Colors.red)),
            ),
            Container(
              width: double.infinity,
              color: Colors.blue,
              padding: EdgeInsets.all(10),
              child: Text(
                "Enable location to discover nearby events, movies, and more.",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  _categoryIcon(Icons.movie, "Movies"),
                  _categoryIcon(Icons.music_note, "Music Shows"),
                  _categoryIcon(Icons.theater_comedy, "Comedy Shows"),
                  _categoryIcon(Icons.event, "Plays"),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(child: Image.asset('assets/event1.jpg', fit: BoxFit.cover)),
                  SizedBox(width: 10),
                  Expanded(child: Image.asset('assets/event2.jpg', fit: BoxFit.cover)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recommended Movies", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("See All >", style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  _movieCard('assets/movie1.jpg', 'PROMOTED', context),
                  _movieCard('assets/movie2.jpg', '', context),
                  _movieCard('assets/movie3.jpg', '', context),
                  _movieCard('assets/movie1.jpg','', context),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select Your Mood", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  DropdownButton<String>(
                    value: selectedMood,
                    onChanged: (newMood) {
                      setState(() {
                        selectedMood = newMood!;
                      });
                    },
                    items: moodMovies.keys.map((mood) {
                      return DropdownMenuItem(
                        value: mood,
                        child: Text(mood),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: moodMovies[selectedMood]!.map((movie) {
                  return _movieCard(movie["image"]!, movie["tag"]!, context);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movies"),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Live Events"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _categoryIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 40),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _movieCard(String imagePath, String tag, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsPage()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(imagePath, width: 100, height: 150),
                if (tag.isNotEmpty)
                  Positioned(
                    top: 5,
                    left: 5,
                    child: Container(
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                      child: Text(tag, style: TextStyle(color: Colors.white, fontSize: 10)),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
