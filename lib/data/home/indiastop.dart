import 'dart:ui';

import 'package:spotify/constants/constants.dart';

class IndiasTopTemplate {
  final String image;
  final String description;

  IndiasTopTemplate(this.image, this.description);
}

class IndiasBest {
  List<IndiasTopTemplate> indisBestData() => [
        IndiasTopTemplate(NetworkImages.indiasTen, "with billie elish..."),
        IndiasTopTemplate(NetworkImages.indiasFirst, "good Vibe Songs"),
        IndiasTopTemplate(NetworkImages.indiasTwo, "Feeling Good alone Songs"),
        IndiasTopTemplate(NetworkImages.indiasThree,
            "Jalpul Singh,Ram leela and night parade indian team"),
        IndiasTopTemplate(NetworkImages.indiasFour,
            "Petta rap Prabhu deva and Vaigai puyal Vadivel"),
        IndiasTopTemplate(
            NetworkImages.indiasFive, "Funny anime and cartoon themes"),
        IndiasTopTemplate(
            NetworkImages.indiasSix, "Top Melody Songs from Kollywood"),
        IndiasTopTemplate(NetworkImages.indiasSeven, "Listening till dawn"),
        IndiasTopTemplate(NetworkImages.indiasEight, "Just for grooving"),
        IndiasTopTemplate(
            NetworkImages.indiasNine, "Swapna Sathish,Yuvan,Vishal and Kani"),
      ];
}
