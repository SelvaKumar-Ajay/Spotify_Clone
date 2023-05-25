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
        EpisForYouTemplate(NetworkImages.episThree, "Demon Slayer",
            "Kimetsu no yaiba journey story"),
        EpisForYouTemplate(NetworkImages.episFour, "Naruto Uzumaki",
            "Monday Motivation by Naruto"),
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
