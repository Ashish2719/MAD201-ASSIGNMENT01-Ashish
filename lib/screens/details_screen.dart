import 'package:flutter/material.dart';
import 'package:labassignment/model/Destinatio.dart';

class DetailsScreen extends StatefulWidget {
  final Destination destination;

  const DetailsScreen({super.key, required this.destination});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final d = widget.destination;

    return Scaffold(
      appBar: AppBar(title: Text(d.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(d.imageUrl),
                if (d.isVisited)
                  const Positioned(
                    top: 10,
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text('Visited'),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(d.description),
                  if (d is TouristDestination) Text('Rating: ${d.rating}'),
                  if (d is CulturalDestination)
                    Text('Famous Food: ${d.famousFood}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() => d.markVisited());
                      Navigator.pop(context, d);
                    },
                    child: const Text('Mark as Visited'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() => d.toggleFavorite());
                      Navigator.pop(context, d);
                    },
                    child: const Text('Add to Favorites'),
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
