import 'package:flutter/material.dart';
import 'package:labassignment/model/destination_repository.dart';

class ProfileScreen extends StatelessWidget {
  final DestinationRepository repository;

  const ProfileScreen({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            AppBar(
              title: const Text('Profile'),
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'Info'),
                  Tab(text: 'Visited'),
                  Tab(text: 'Stats'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Tab 1 - User Info
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            'https://via.placeholder.com/150',
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Ashish Prajapati'),
                        Text('Traveler Level: Beginner'),
                      ],
                    ),
                  ),
                  // Tab 2 - Visited Destinations
                  ListView(
                    children: repository
                        .getAllDestinations()
                        .where((d) => d.isVisited)
                        .map((d) => ListTile(title: Text(d.name)))
                        .toList(),
                  ),
                  // Tab 3 - Stats
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Favorites: ${repository.getAllDestinations().where((d) => d.isFavorite).length}',
                        ),
                        Text(
                          'Visited Countries: ${repository.getVisitedCountries().length}',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
