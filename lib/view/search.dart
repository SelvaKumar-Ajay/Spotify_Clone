import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';
import 'package:spotify/data/search/cards.dart';
import 'package:spotify/reusable_widgets/search/reusable_widgets.dart';
import '../reusable_widgets/home/reusable_widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<SearchTabCards> searchTabData = SearchTabDataCards().serachTabData;

    return Padding(
      padding: EdgeInsets.all(width * 0.03),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleText(text: StringConstants.searchHeader, width: width),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                height:
                    SearchSizes(height: height, width: width).containerheight,
                width: SearchSizes(height: height, width: width).containerwidth,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                        SearchSizes(height: height, width: width)
                            .iconPaddingAll,
                      ),
                      child: Image.asset(
                        IconConstants.searchIcon,
                        height: SearchSizes(height: height, width: width)
                            .iconheight,
                        width: SearchSizes(height: height, width: width)
                            .iconheight,
                        color: blackColor,
                      ),
                    ),
                    const Text(
                      StringConstants.serachButtonText,
                      style: TextStyle(
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        wordSpacing: 3.0,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                IconConstants.microphoneIcon,
                color: whiteColor,
                height: SearchSizes(height: height, width: width).micIconHeight,
                width: SearchSizes(height: height, width: width).micIconWidth,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical:
                    SearchSizes(height: height, width: width).browseAllPadding),
            child: const Text(
              StringConstants.browseAll,
              style: TextStyle(
                  color: whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  letterSpacing: 0.5),
            ),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: ContainerSizes(height: height, width: width)
                    .crossMainAxisSpaces,
                mainAxisSpacing: ContainerSizes(height: height, width: width)
                    .crossMainAxisSpaces,
                childAspectRatio: 2.0),
            shrinkWrap: true,
            itemBuilder: (context, index) => cards(
                height: height,
                width: width,
                color: searchTabData[index].color,
                img: searchTabData[index].img,
                text: searchTabData[index].text),
            itemCount: searchTabData.length,
          ),
        ],
      ),
    );
  }
}
