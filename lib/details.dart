import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'booking_page.dart'; // Import the BookingPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DetailsPage(),
    );
  }
}

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Emergency"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Icon(Icons.share),
          SizedBox(width: 10),
          Icon(Icons.more_vert),
          SizedBox(width: 10),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Movie Banner
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/banner1.jpg",
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 140,
                    child: Column(
                      children: [
                        Icon(Icons.play_circle_fill, color: Colors.white, size: 60),
                        SizedBox(height: 5),
                        Text(
                          "Trailers (4)",
                          style: GoogleFonts.roboto(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Rating Section
              Row(
                children: [
                  Icon(Icons.star, color: Colors.redAccent, size: 24),
                  SizedBox(width: 5),
                  Text(
                    "8.2/10 ",
                    style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text("(7.8K Votes)", style: GoogleFonts.roboto(fontSize: 14, color: Colors.grey)),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade100,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text("Rate now", style: TextStyle(color: Colors.redAccent)),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Movie Info
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("2D", style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 8),
                  Text("HINDI", style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 5),
              Text(
                "2h 27m • Drama, Historical • UA • 17 Jan, 2025",
                style: GoogleFonts.roboto(fontSize: 14, color: Colors.grey.shade600),
              ),
              SizedBox(height: 8),
              Text(
                "Emergency is based on true events that unfolded in 1975. The film chronicles incidents that took pla...",
                style: GoogleFonts.roboto(fontSize: 14, color: Colors.black),
              ),
              SizedBox(height: 8),

              // Trending Section
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.trending_up, color: Colors.blue),
                    SizedBox(width: 8),
                    Text("Trending", style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue)),
                    Spacer(),
                    Text("18.28K tickets booked in last 24 hours", style: GoogleFonts.roboto(fontSize: 14)),
                  ],
                ),
              ),
              SizedBox(height: 15),

              // Ads Banner
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/prime.jpg",
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 15),

              // Book Tickets Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookingPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 100),
                  ),
                  child: Text("Book tickets", style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
