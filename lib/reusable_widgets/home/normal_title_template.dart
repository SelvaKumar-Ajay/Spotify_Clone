import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';

Column normalTitleTemplate({
  required double height,
  required double width,
  required String image,
  required String description,
  required String text,
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
                    width:
                        NormalTitleTemplateSizes(height: height, width: width)
                            .bottomBarWidth))),
        margin: EdgeInsets.fromLTRB(
            0,
            0,
            NormalTitleTemplateSizes(height: height, width: width)
                .rightMarginSize,
            NormalTitleTemplateSizes(height: height, width: width)
                .containerTextSpace),
        height: NormalTitleTemplateSizes(height: height, width: width)
            .sizeOfContainer,
        width: NormalTitleTemplateSizes(height: height, width: width)
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
          text,
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 13.0,
            color: whiteColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      SizedBox(
        height: NormalTitleTemplateSizes(height: height, width: width)
            .textBoxHeight,
        width: NormalTitleTemplateSizes(height: height, width: width)
            .sizeOfContainer,
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
