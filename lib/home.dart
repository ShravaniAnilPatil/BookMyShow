import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
            // Location Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text("Navi Mumbai", style: TextStyle(color: Colors.red)),
            ),

            // Location Enable Bar
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

            // Categories (Movies, Music Shows, etc.)
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


            // Recommended Movies Section
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
                  _movieCard('assets/movie1.jpg', 'PROMOTED'),
                  _movieCard('assets/movie2.jpg', ''),
                  _movieCard('assets/movie3.jpg', ''),
                ],
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
}
Widget _movieCard(String imagePath, String tag) {
  return Padding(
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
  );
}
