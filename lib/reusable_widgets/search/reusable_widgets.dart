import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';

Container cards({
  required double height,
  required double width,
  required String text,
  required String img,
  required Color color,
}) {
  return Container(
    clipBehavior: Clip.antiAlias,
    // alignment: Alignment.center,
    // color: redColor,
    // child: Text("$index"),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                ContainerSizes(height: height, width: width).textPaddingLeft,
                ContainerSizes(height: height, width: width)
                    .textPaddingTopRight,
                0,
                0),
            child: SizedBox(
              width: ContainerSizes(height: height, width: width).textSizedBox,
              child: Text(
                text,
                maxLines: 4,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                    fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Transform.rotate(
            // alignment: Alignment.center,
            angle: 30 * 0.0174533,
            origin: const Offset(0, 50),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
              child: Image.asset(
                fit: BoxFit.contain,
                img,
                height:
                    ContainerSizes(height: height, width: width).imgHeightWidth,
                width:
                    ContainerSizes(height: height, width: width).imgHeightWidth,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
