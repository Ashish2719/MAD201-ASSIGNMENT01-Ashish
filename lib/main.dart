/// MAD201 - Lab 01
/// Author: Ashishkumar Prajapati
/// Student ID: A00194842
/// Description: Defines Destination base class and its subclasses for travel app.

import 'package:flutter/material.dart';
import 'package:labassignment/model/Destinatio.dart';
import 'package:labassignment/model/destination_repository.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatefulWidget {
  const TravelApp({super.key});
  @override
  State<TravelApp> createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  final DestinationRepository repository = DestinationRepository();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Add initial destinations
    repository.addDestination(
      TouristDestination(
        name: 'Paris',
        country: 'France',
        description: 'City of Lights',
        imageUrl: 'https://via.placeholder.com/150',
        rating: 4.7,
      ),
    );
    repository.addDestination(
      CulturalDestination(
        name: 'Tokyo',
        country: 'Japan',
        description: 'Cultural capital',
        imageUrl: 'https://via.placeholder.com/150',
        famousFood: 'Sushi',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(repository: repository),
      const Center(child: Text('No bookings yet')),
      ProfileScreen(repository: repository),
    ];

    return MaterialApp(
      title: 'Travel App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Travel App')),
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Bookings'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          onTap: (i) => setState(() => currentIndex = i),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(child: Text('Menu')),
              ListTile(title: const Text('Settings'), onTap: () {}),
              ListTile(
                title: const Text('Help'),
                onTap: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Help clicked')));
                },
              ),
              ListTile(
                title: const Text('About'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Scaffold(
                        appBar: AppBar(title: const Text('About')),
                        body: const Center(child: Text('This is Travel App')),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
