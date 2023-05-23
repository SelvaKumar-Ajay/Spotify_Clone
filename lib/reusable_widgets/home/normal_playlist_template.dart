import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';

Column normalPlayListTemplate({
  required double height,
  required double width,
  required String image,
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
                    width: NormalPlaylistTemplateSizes(
                            height: height, width: width)
                        .bottomBarWidth))),
        margin: EdgeInsets.fromLTRB(
            0,
            0,
            NormalPlaylistTemplateSizes(height: height, width: width)
                .rightMarginSize,
            NormalPlaylistTemplateSizes(height: height, width: width)
                .containerTextSpace),
        height: NormalPlaylistTemplateSizes(height: height, width: width)
            .sizeOfContainer,
        width: NormalPlaylistTemplateSizes(height: height, width: width)
            .sizeOfContainer,
        child: Image(
          image: NetworkImage(image),
          fit: BoxFit.cover,
          height: NormalPlaylistTemplateSizes(height: height, width: width)
              .sizeOfContainer,
          width: NormalPlaylistTemplateSizes(height: height, width: width)
              .sizeOfContainer,
        ),
      ),
      SizedBox(
        height: NormalPlaylistTemplateSizes(height: height, width: width)
            .textBoxHeight,
        width: NormalPlaylistTemplateSizes(height: height, width: width)
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
