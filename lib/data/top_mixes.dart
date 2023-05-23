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
            "https://images.unsplash.com/photo-1505430111830-b998ef798efa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8c2luZ2Vyc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
            "Jennie Solo with Blackpink members Lisa,Rose,Sooya",
            "Jennie Solo Performance in Canada - BlackPink"),
        TopMixDataTemplate(
            blueColor,
            "https://images.unsplash.com/photo-1502056618377-f15b18d813b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8c2luZ2Vyc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
            "Jap Pop",
            "Jap pop Mixes by Rock Lee and Guy sensei with help of kakashi and Jiraiya sensei"),
        TopMixDataTemplate(
            whiteColor,
            "https://images.unsplash.com/photo-1573219530924-458d5e74313b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8c2luZ2Vyc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
            "Rap",
            "Rapper Killer Bee Mixes with leaf village hero Uzumaki Naruto"),
        TopMixDataTemplate(
            yellowColor,
            "https://images.unsplash.com/photo-1505100119535-f14893f91436?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8c2luZ2Vyc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
            "Study Books that will help to study people",
            "Study notes and tips by SK"),
      ];
}
