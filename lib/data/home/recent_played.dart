import 'package:spotify/constants/constants.dart';

class RecentTemplate {
  final String image;
  final String text;

  RecentTemplate(this.image, this.text);
}

class RecentViewed {
  List<RecentTemplate> recentData() => [
        RecentTemplate(NetworkImages.naruto, "Naroto theme musics and songs"),
        RecentTemplate(NetworkImages.ninetys, "90's kids love"),
        RecentTemplate(NetworkImages.episFive, "Jujutsu kaisen"),
        RecentTemplate(NetworkImages.episFour, "Couple Goal"),
        RecentTemplate(NetworkImages.indiasFour,
            "Petta rap Prabhu deva and Vaigai puyal Vadivel"),
        RecentTemplate(
          NetworkImages.romance,
          "Romantic Songs",
        ),
      ];
}
