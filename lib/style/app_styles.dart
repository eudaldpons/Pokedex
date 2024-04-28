import 'package:flutter/material.dart';

class AppStyles {
  static final ButtonStyle selectedFilter = OutlinedButton.styleFrom(
    backgroundColor: Colors.grey[100],
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
    side: const BorderSide(color: Colors.white),
  );

  static final ButtonStyle unselectedFilter = OutlinedButton.styleFrom(
    backgroundColor: Colors.grey[100],
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
    side: const BorderSide(color: Color(0xFFFCA424)),
  );

  //Paragraph for widgets expanded
  static const TextStyle paragraph = TextStyle(
      height: 1.4,
      color: Color(0xff464646),
      fontSize: 15.0,
      fontFamily: "SanFrancisco");

  //Paragraph for widgets expanded
  static const TextStyle onBoarding = TextStyle(
      color: Colors.black,
      fontFamily: 'SanFrancisco',
      fontWeight: FontWeight.bold,
      fontSize: 30);

  //Paragraph for widgets expanded
  static const TextStyle onBoardingSubtitle = TextStyle(
      color: Colors.black,
      fontFamily: 'SanFrancisco',
      fontWeight: FontWeight.bold,
      fontSize: 30);

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
