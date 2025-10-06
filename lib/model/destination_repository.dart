/// MAD201 - Assignment 01
/// Author: Ashishkumar Prajapati
/// Student ID: A00194842
/// Description: Repository to store and manage destinations.

library;

import 'package:labassignment/model/Destinatio.dart';

class DestinationRepository {
  final List<Destination> _destinations = [];

  List<Destination> getAllDestinations() => _destinations;

  void addDestination(Destination d) => _destinations.add(d);

  void toggleFavorite(Destination d) => d.toggleFavorite();

  void markVisited(Destination d) => d.markVisited();

  Set<String> getVisitedCountries() =>
      _destinations.where((d) => d.isVisited).map((d) => d.country).toSet();
}
