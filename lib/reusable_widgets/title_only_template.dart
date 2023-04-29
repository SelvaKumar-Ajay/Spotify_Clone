import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';

Column titleOnlyTemplate({
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
        decoration: BoxDecoration(
            // color: blueColor,
            border: Border(
                bottom: BorderSide(
                    width: TitleOnlyTemplateSizes(height: height, width: width)
                        .bottomBarWidth))),
        margin: EdgeInsets.fromLTRB(
            0,
            0,
            TitleOnlyTemplateSizes(height: height, width: width)
                .rightMarginSize,
            TitleOnlyTemplateSizes(height: height, width: width)
                .containerTextSpace),
        height: TitleOnlyTemplateSizes(height: height, width: width)
            .sizeOfContainer,
        width: TitleOnlyTemplateSizes(height: height, width: width)
            .sizeOfContainer,
        child: Image.asset(
          image,
          color: whiteColor,
        ),
      ),
      SizedBox(
        height:
            TitleOnlyTemplateSizes(height: height, width: width).textBoxHeight,
        width: TitleOnlyTemplateSizes(height: height, width: width)
            .sizeOfContainer,
        child: Text(
          text,
          maxLines: 2,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12.0,
            color: whiteColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  );
}
