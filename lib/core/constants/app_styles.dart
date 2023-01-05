import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'AppColors.dart';

class AppStyles {
  static double contentVerticalPaddingValue = 1.5.h;
  static double contentHorizontalPaddingValue = 2.5.w;

  static EdgeInsetsGeometry horizontalPadding =
      EdgeInsets.symmetric(horizontal: 5.w);
  static EdgeInsetsGeometry zeroPadding = EdgeInsets.zero;
  static EdgeInsetsGeometry verticalPadding =
      EdgeInsets.symmetric(vertical: 5.w);
  static EdgeInsetsGeometry allPadding =
      EdgeInsets.symmetric(vertical: 5.w, horizontal: 5.w);
  static EdgeInsetsGeometry contentPadding = EdgeInsets.symmetric(
      vertical: contentVerticalPaddingValue,
      horizontal: contentHorizontalPaddingValue);
  static EdgeInsetsGeometry contentVerticalPadding = EdgeInsets.symmetric(
    vertical: contentVerticalPaddingValue,
  );
  static EdgeInsetsGeometry contentHorizontalPadding =
      EdgeInsets.symmetric(horizontal: contentHorizontalPaddingValue);
  static BorderRadius borderRadius8 = BorderRadius.circular(8);
  static BorderRadius borderRadius = BorderRadius.circular(10);
  static BorderRadius cardRadius = BorderRadius.circular(15);
  static BorderRadius cardRadius20 = BorderRadius.circular(20);
  static List<BoxShadow> primaryShadow = [
    BoxShadow(
      color: AppColors.grey.shade50.withOpacity(0.3),
      blurRadius: 5,
      offset: const Offset(0.5,0.5),
    ),
  ];

  // static List<BoxShadow> primaryShadow = [
  //   BoxShadow(
  //     color: AppColors.grey.shade50,
  //     blurRadius: 10,
  //     offset: const Offset(1, 1),
  //   ),
  // ];

  static List<BoxShadow> secondaryShadow = [
    BoxShadow(
      color: AppColors.greySwatch[20]!,
      blurRadius: 7,
      offset: const Offset(1, 4),
    ),
  ];
  static List<BoxShadow> redShadow = [
    BoxShadow(
      spreadRadius: 0,
      color: AppColors.red,
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
  ];

  static ShapeBorder appBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(30),
    ),
  );

  static Decoration circleImageDecoration = BoxDecoration(
      shape: BoxShape.circle,
      gradient:
          LinearGradient(colors: [AppColors.primary, AppColors.primary[100]!]));
}

const EdgeInsetsGeometry DefaultEdgeInsets = EdgeInsets.all(8);
const Offset offset = const Offset(5, 5);
const double blurRadius = 10;
const Color bottomShadowColor = const Color(0x26234395);
const Color topShadowColor = Colors.white60;

List<BoxShadow> defaultShadow = [
  BoxShadow(
    offset: offset,
    blurRadius: blurRadius,
    color: bottomShadowColor,
  ),
  BoxShadow(
    offset: Offset(-offset.dx, -offset.dx),
    blurRadius: blurRadius,
    color: topShadowColor,
  ),
];

List<BoxShadow> containerShadow = [
  BoxShadow(
      color: borderLine,
      offset: const Offset(2.1, 2.1),
      blurRadius: DefaultRadius)
];

// Radius
BorderRadius borderRadius = BorderRadius.circular(DefaultRadius);
BorderRadius borderBoxRadius = BorderRadius.circular(BoxRadius);
BorderRadius circularBorder = BorderRadius.all(Radius.circular(DefaultRadius));

// Decoration
BoxDecoration mainBoxDecoration =
    BoxDecoration(color: grey, borderRadius: BorderRadius.circular(PageRadius));
BoxDecoration pageBoxDecoration = BoxDecoration(
    color: white,
    borderRadius: BorderRadius.circular(PageRadius),
    boxShadow: containerShadow);
BoxDecoration boxDecoration = BoxDecoration(
  color: white,
  borderRadius: borderBoxRadius,
);
BoxDecoration buttonBoxDecoration = BoxDecoration(
  boxShadow: containerShadow,
  borderRadius: borderBoxRadius,
);
BoxDecoration iconBoxDecoration = BoxDecoration(
  color: grey,
  /*boxShadow: containerShadow,*/ borderRadius: borderBoxRadius,
);

RoundedRectangleBorder roundedRectangleBorder =
    RoundedRectangleBorder(borderRadius: borderRadius);

// Border

OutlineInputBorder outLineBorder = OutlineInputBorder(
  borderRadius: circularBorder,
  borderSide: BorderSide.none,
//      BorderSide(style: BorderStyle.solid, width: 1.0, color: borderLine),
);

const indigoAccent = Color.fromRGBO(109, 113, 249, 1);
const grey = Color(0xFFF3FCFA);

// Color.fromRGBO(239, 241, 247, 1);
const cardShadowColor = Color(0xFFd3d1d1);
const primaryColor = Color.fromRGBO(10, 25, 49, 1);
const accentColor = Color.fromRGBO(255, 201, 71, 1);
const borderLine = Color(0xffc0c0c0);
const white = Colors.white;
const blue = Color.fromRGBO(24, 90, 219, 1);
const transparent = Colors.transparent;

/// Responsive Sizes
const DesktopWidth = 1100;
const TabletWidth = 650;

/// Decoration Sizes
const DefaultPadding = 10.0;
const DefaultRadius = 10.0;
const PageRadius = 20.0;
const BoxRadius = 8.0;

/// Font Sizes
const TinyFontSize = 5.0;
const SmallFontSize = 6.0;
const RegularFontSize = 8.0;
const MediumFontSize = 10.0;
