import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'navbar_rider.dart';
import 'dart:developer' as developer;

class HomePage2 extends StatelessWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CarPool'),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.bell),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/homepage2.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 500, // Adjust as needed to position this ad above the other ad
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded( // Use Expanded to prevent overflow
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Special Offer!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text('Get 10% off on your next ride.'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8), // Add spacing between text and button
                  ElevatedButton(
                    onPressed: () {
                      developer.log("Special Offer Clicked!"); // Log the click event
                    },
                    child: const Text('Get Offer'),
                  ),
                ],
              ),
            ),
          ),
          // Second Publicity Section (RentCar)
          Positioned(
            bottom: 350, // Adjust this for RentCar ad to stack with some space above NavbarRider
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded( // Use Expanded to prevent overflow
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rent a Car Today!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text('Convenient and affordable car rentals.'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8), // Add spacing between text and button
                  ElevatedButton(
                    onPressed: () {
                      developer.log("RentCar Clicked!"); // Log RentCar click
                    },
                    child: const Text('Rent Now'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const NavbarRider(),
    );
  }
}
