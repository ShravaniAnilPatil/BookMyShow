import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emergency"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Date Selection
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _dateWidget("WED", "22", "JAN", true),
                  _dateWidget("THU", "23", "JAN", false),
                  _dateWidget("FRI", "24", "JAN", false),
                  _dateWidget("SAT", "25", "JAN", false),
                  _dateWidget("SUN", "26", "JAN", false),
                  _dateWidget("MON", "27", "JAN", false),
                ],
              ),
            ),
          ),

          // Price Filter
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _filterChip("Sort by"),
                  SizedBox(width: 10),
                  _filterChip("₹0 - ₹100"),
                  SizedBox(width: 10),
                  _filterChip("₹101 - ₹200"),
                  SizedBox(width: 10),
                  _filterChip("₹201 - ₹300"),
                ],
              ),
            ),
          ),

          // Theater List
          Expanded(
            child: ListView(
              children: [
                _theaterSection(
                  context,
                  "Cinepolis: Nexus Seawoods, Navi Mumbai",
                  ["12:35 PM", "03:40 PM", "06:45 PM", "09:50 PM", "10:35 PM"],
                ),
                _theaterSection(
                  context,
                  "PVR: Orion Mall, Panvel",
                  ["01:05 PM", "04:10 PM", "07:15 PM", "10:20 PM", "11:20 PM"],
                ),
                _theaterSection(
                  context,
                  "BMX Cinemas(BalajiMovieplex): Littleworld Kharghar",
                  ["02:15 PM", "05:30 PM", "08:45 PM"],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back), label: "Back"),
        ],
      ),
    );
  }

  Widget _dateWidget(String day, String date, String month, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.red : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            day,
            style: GoogleFonts.roboto(
              color: isSelected ? Colors.white : Colors.grey,
              fontSize: 14,
            ),
          ),
          Text(
            date,
            style: GoogleFonts.roboto(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            month,
            style: GoogleFonts.roboto(
              color: isSelected ? Colors.white : Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _filterChip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: GoogleFonts.roboto(fontSize: 14)),
    );
  }

  Widget _theaterSection(BuildContext context, String name, List<String> showtimes) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  name,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "INFO",
                style: GoogleFonts.roboto(
                  color: Colors.blue,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            "Cancellation available",
            style: GoogleFonts.roboto(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: showtimes.map((time) => _showtimeButton(context, time)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _showtimeButton(BuildContext context, String time) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SeatSelectionPage(showtime: time),
          ),
        );
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.green),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        time,
        style: GoogleFonts.roboto(
          color: Colors.green,
          fontSize: 14,
        ),
      ),
    );
  }
}

class SeatSelectionPage extends StatefulWidget {
  final String showtime;

  SeatSelectionPage({required this.showtime});

  @override
  _SeatSelectionPageState createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  String selectedSeatType = 'Classic';
  List<String> selectedSeats = [];
  Map<String, int> seatPrices = {
    'Classic': 100,
    'Premium': 150,
    'Deluxe': 200,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Seats"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Showtime: ${widget.showtime}",
                style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            DropdownButton<String>(
              value: selectedSeatType,
              items: seatPrices.keys.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text("$value - ₹${seatPrices[value]}"),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedSeatType = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            _buildSeatGrid(),
            SizedBox(height: 20),
            Text(
              "Selected Seats: ${selectedSeats.join(', ')}",
              style: GoogleFonts.roboto(fontSize: 16),
            ),
            Text(
              "Total Price: ₹${_calculateTotalPrice()}",
              style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectedSeats.isNotEmpty ? _confirmBooking : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Changed from primary
                foregroundColor: Colors.white, // Changed from onPrimary
              ),
              child: Text("Confirm Booking"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeatGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 40,
      itemBuilder: (context, index) {
        String seatNumber = String.fromCharCode(65 + index ~/ 8) + (index % 8 + 1).toString();
        bool isSelected = selectedSeats.contains(seatNumber);
        return GestureDetector(
          onTap: () => _toggleSeatSelection(seatNumber),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.red : Colors.white,
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                seatNumber,
                style: GoogleFonts.roboto(
                  color: isSelected ? Colors.white : Colors.red,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _toggleSeatSelection(String seatNumber) {
    setState(() {
      if (selectedSeats.contains(seatNumber)) {
        selectedSeats.remove(seatNumber);
      } else {
        selectedSeats.add(seatNumber);
      }
    });
  }

  int _calculateTotalPrice() {
    return selectedSeats.length * seatPrices[selectedSeatType]!;
  }

  void _confirmBooking() {
    // Implement booking confirmation logic here
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Booking Confirmed"),
        content: Text("You have booked ${selectedSeats.length} ${selectedSeatType} seats for ${widget.showtime}"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}

