/// MAD201 - Lab 01
/// Author: Ashishkumar Prajapati
/// Student ID: A00194842
/// Description: Defines Destination base class and its subclasses for travel app.
library;

/// Represents a travel destination.
class Destination {
  /// Name of the destination
  final String name;

  /// Country of the destination
  final String country;

  /// Short description
  final String description;

  /// Image URL
  final String imageUrl;

  /// Favorite status
  bool isFavorite;

  /// Visited status
  bool isVisited;

  Destination({
    required this.name,
    required this.country,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false,
    this.isVisited = false,
  });

  /// Toggles favorite status
  void toggleFavorite() => isFavorite = !isFavorite;

  /// Marks destination as visited
  void markVisited() => isVisited = true;
}

/// Tourist destination with rating
class TouristDestination extends Destination {
  final double rating;

  TouristDestination({
    required super.name,
    required super.country,
    required super.description,
    required super.imageUrl,
    super.isFavorite,
    super.isVisited,
    required this.rating,
  });
}

/// Cultural destination with famous food
class CulturalDestination extends Destination {
  final String famousFood;

  CulturalDestination({
    required super.name,
    required super.country,
    required super.description,
    required super.imageUrl,
    super.isFavorite,
    super.isVisited,
    required this.famousFood,
  });
}
