import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';

//Your Top mixes template (Stacked Playlist template)
Column yourTopMixesTemplate({
  required double height,
  required double width,
  required Color color,
  required String image,
  required String text,
  required String description,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
            // color: blueColor,
            border: Border(
                bottom: BorderSide(
                    color: color,
                    width: YourtopMixSizes(height: height, width: width)
                        .bottomBarWidth))),
        margin: EdgeInsets.fromLTRB(
            0,
            0,
            YourtopMixSizes(height: height, width: width).rightMarginSize,
            YourtopMixSizes(height: height, width: width).containerTextSpace),
        height: YourtopMixSizes(height: height, width: width).sizeOfContainer,
        width: YourtopMixSizes(height: height, width: width).sizeOfContainer,
        child: Stack(
          children: [
            Image(
              image: NetworkImage(image),
              fit: BoxFit.cover,
              height:
                  YourtopMixSizes(height: height, width: width).sizeOfContainer,
              width:
                  YourtopMixSizes(height: height, width: width).sizeOfContainer,
            ),
            Padding(
              padding: EdgeInsets.all(
                  YourtopMixSizes(height: height, width: width).paddingSize),
              child: Align(
                alignment: Alignment.topLeft,
                // ignore: sized_box_for_whitespace
                child: Container(
                  height: YourtopMixSizes(height: height, width: width)
                      .spotifyIconHeight,
                  width: YourtopMixSizes(height: height, width: width)
                      .spotifyIconWidth,
                  child: Image.asset(
                    IconConstants.spotifyIcon,
                    color: whiteColor,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: YourtopMixSizes(height: height, width: width)
                      .bottomPadding),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: YourtopMixSizes(height: height, width: width)
                      .bottomTextContainerHeight,
                  decoration: BoxDecoration(
                      color: transparentColor,
                      border: Border(
                          left: BorderSide(
                              color: color,
                              width:
                                  YourtopMixSizes(height: height, width: width)
                                      .bottomtextContainerBorderWidth))),
                  child: Text("  $text"),
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: YourtopMixSizes(height: height, width: width).textBoxHeight,
        width: YourtopMixSizes(height: height, width: width).sizeOfContainer,
        child: Text(
          description,
          maxLines: 2,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12.0,
            color: greyColor.withOpacity(0.4),
          ),
        ),
      ),
    ],
  );
}
