import 'dart:ui';

import 'package:spotify/constants/constants.dart';

class EpisForYouTemplate {
  final String image;
  final String text;
  final String description;

  EpisForYouTemplate(this.image, this.description, this.text);
}

class EpisodeData {
  List<EpisForYouTemplate> episData() => [
        EpisForYouTemplate(
            NetworkImages.episOne, "Nikki Bella", "Japanese Singer"),
        EpisForYouTemplate(
            NetworkImages.episTwo, "Your Name", "Your name Songs"),
        EpisForYouTemplate(NetworkImages.episThree, "Motivation",
            "Monday Motivation by Naruto"),
        EpisForYouTemplate(
            NetworkImages.episFour, "Couple Goal", "Songs for Couples"),
        EpisForYouTemplate(NetworkImages.indiasFour, "Rap",
            "Petta rap Prabhu deva and Vaigai puyal Vadivel"),
        EpisForYouTemplate(
            NetworkImages.episFive, "Jujutsu Kaisen", "Jutsu by Gojo Satorou"),
        EpisForYouTemplate(
            NetworkImages.indiasEight, "Just", "Just for grooving"),
        EpisForYouTemplate(NetworkImages.indiasNine, "Singers",
            "Swapna Sathish,Yuvan,Vishal and Kani"),
      ];
}
