import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle titleGallery = TextStyle(
      color: Colors.black,
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
      fontFamily: "SanFrancisco");

  static const TextStyle subtitleGallery = TextStyle(
      color: Color(0xff464646),
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "SanFrancisco");

  static const TextStyle searchText = TextStyle(
      color: Color(0xff464646), fontSize: 16.0, fontFamily: "SanFrancisco");

  static const TextStyle galleryPokemonInfoSubtitle = TextStyle(
      color: Colors.black,
      fontFamily: 'SanFrancisco',
      fontWeight: FontWeight.bold,
      fontSize: 12);

  static TextStyle galleryPokemonId = TextStyle(
      color: Colors.grey.shade700,
      fontFamily: 'SanFrancisco',
      fontWeight: FontWeight.bold,
      fontSize: 20);

  static TextStyle detailsPokemonId = const TextStyle(
      color: Colors.black,
      fontFamily: 'SanFrancisco',
      fontWeight: FontWeight.bold,
      fontSize: 25);

  //Paragraph for widgets expanded
  static const TextStyle galleryPokemonName = TextStyle(
      color: Colors.black,
      fontFamily: 'SanFrancisco',
      fontWeight: FontWeight.bold,
      fontSize: 25);

  //Paragraph for widgets expanded
  static const TextStyle galleryPokemonInfo = TextStyle(
      color: Colors.black,
      fontFamily: 'SanFrancisco',
      fontWeight: FontWeight.bold,
      fontSize: 20);

  //Style for text in a subparagraph for widgets expanded
  static const TextStyle subparagraph = TextStyle(
      color: Color(0xff9b9b9b), fontSize: 12.0, fontFamily: "SanFrancisco");

  //title sections for expanded widgets
  static const TextStyle widgetEventsTitle = TextStyle(
    fontFamily: "SanFrancisco",
    color: Colors.white,
    fontSize: 27,
  );

  //title sections for main sections
  static const TextStyle sectionFeedPage =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25);

  //title sections for expanded widgets
  static const TextStyle widgetEventsSubtitle = TextStyle(
      fontFamily: "SanFrancisco", fontSize: 16, color: Colors.black87);

  //title sections for expanded widgets
  static const TextStyle widgetTitle = TextStyle(
      fontFamily: "SanFrancisco", fontSize: 15, color: Colors.black54);

  //title sections for expanded widgets
  static TextStyle widgetSubtitle = TextStyle(
      fontFamily: "SanFrancisco",
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.grey.withOpacity(0.8));

  static const TextStyle widgetActivitiesTopTitle = TextStyle(
      fontFamily: "SanFrancisco",
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: Colors.white);

  static const TextStyle widgetActivitiesTopSubtitle = TextStyle(
    fontFamily: "SanFrancisco",
    fontSize: 16,
    color: Colors.black54,
  );

  //title sections for expanded widgets
  static const TextStyle sectionTitle = TextStyle(
    fontFamily: "SanFrancisco",
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle noDataTitle =
      TextStyle(color: Colors.black, fontFamily: 'SanFrancisco', fontSize: 25);

  static TextStyle noDataSubtitle = TextStyle(
    fontFamily: 'SanFrancisco',
    color: Colors.grey[600],
    fontSize: 16,
  );

  static const TextStyle userName = TextStyle(
      color: Colors.black, fontSize: 16.0, fontFamily: "SanFrancisco");

  static const TextStyle dateActivitiesPage = TextStyle(
    fontSize: 20,
    fontFamily: "SanFrancisco",
    color: Colors.grey,
  );
}
