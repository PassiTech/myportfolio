import 'package:flutter/material.dart';

class Project {
  final String title;
  final String descriptionFR;
  final String descriptionEN;
  final String date;
  final String duration;
  final List<String> technologies;
  final String imageUrl;

  Project({
    required this.title,
    required this.descriptionFR,
    required this.descriptionEN,
    required this.date,
    required this.duration,
    required this.technologies,
    required this.imageUrl,
  });
}
