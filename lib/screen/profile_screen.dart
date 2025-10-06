// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:labassignment/model/destination_repository.dart';

class ProfileScreen extends StatelessWidget {
  final DestinationRepository repository;

  const ProfileScreen({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Info'),
              Tab(text: 'Visited'),
              Tab(text: 'Stats'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
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
            ListView(
              children: repository
                  .getAllDestinations()
                  .where((d) => d.isVisited)
                  .map((d) => ListTile(title: Text(d.name)))
                  .toList(),
            ),
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
    );
  }
}
