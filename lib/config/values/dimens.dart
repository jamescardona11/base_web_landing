import 'package:argo/argo.dart';
import 'package:flutter/material.dart';

const double kSizeHeaderBar = 65;
const double kSpaceBig = 30;
const double kSpaceMedium = 20;
const double kSpaceSmall = 10;
const double kSpaceLittle = 5;

const kSpaceBigVertical = SizedBox(height: kSpaceBig);
const kSpaceMediumVertical = SizedBox(height: kSpaceMedium);
const kSpaceSmallVertical = SizedBox(height: kSpaceSmall);
const kSpaceLittleVertical = SizedBox(height: kSpaceLittle);

const kSpaceBigHorizontal = SizedBox(width: kSpaceBig);
const kSpaceMediumHorizontal = SizedBox(width: kSpaceMedium);
const kSpaceSmallHorizontal = SizedBox(width: kSpaceSmall);
const kSpaceLittleHorizontal = SizedBox(width: kSpaceLittle);

// Radius
final borderRadiusNormal = BorderRadius.circular(15);

EdgeInsets getPaddingMainPages(BuildContext context) => EdgeInsets.symmetric(
      vertical: context.heightPct(5),
      horizontal: context.widthPct(10),
    );

EdgeInsets getHorizontalPaddingMainPages(BuildContext context) =>
    EdgeInsets.symmetric(horizontal: context.widthPct(2));
