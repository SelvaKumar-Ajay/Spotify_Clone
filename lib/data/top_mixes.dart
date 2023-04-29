import 'dart:ui';

import 'package:spotify/constants/constants.dart';

class TopMixDataTemplate {
  final Color color;
  final String image;
  final String text;
  final String description;

  TopMixDataTemplate(this.color, this.image, this.text, this.description);
}

class TopMixData {
  List<TopMixDataTemplate> yourTopMixesData() => [
        TopMixDataTemplate(
            redColor,
            IconConstants.computerIcon,
            "Jennie Solo with Blackpink members Lisa,Rose,Sooya",
            "Jennie Solo Performance in Canada - BlackPink"),
        TopMixDataTemplate(blueColor, IconConstants.goToSongRadio, "Jap Pop",
            "Jap pop Mixes by Rock Lee and Guy sensei with help of kakashi and Jiraiya sensei"),
        TopMixDataTemplate(whiteColor, IconConstants.addtoQueueIcon, "Rap",
            "Rapper Killer Bee Mixes with leaf village hero Uzumaki Naruto"),
        TopMixDataTemplate(
            yellowColor,
            IconConstants.libraryIcon,
            "Study Books that will help to study people",
            "Study notes and tips by SK"),
      ];
}
