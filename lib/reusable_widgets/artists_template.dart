import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';

Column artistTemplate({
  required double height,
  required double width,
  required String image,
  required String text,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              ArtistTemplateSizes(width: width, height: height)
                  .artistCircularSize),
          color: blueColor,
        ),
        margin: EdgeInsets.fromLTRB(
            0,
            0,
            NormalTitleTemplateSizes(height: height, width: width)
                .rightMarginSize,
            NormalTitleTemplateSizes(height: height, width: width)
                .containerTextSpace),
        height: NormalPlaylistTemplateSizes(height: height, width: width)
            .sizeOfContainer,
        width: NormalPlaylistTemplateSizes(height: height, width: width)
            .sizeOfContainer,
        child: Image.asset(
          image,
          color: whiteColor,
        ),
      ),
      SizedBox(
        height:
            NormalTitleTemplateSizes(width: width, height: height).textHeight,
        width: NormalTitleTemplateSizes(width: width, height: height).textWidth,
        child: Text(
          textAlign: TextAlign.center,
          text,
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 15.0,
            color: whiteColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  );
}
