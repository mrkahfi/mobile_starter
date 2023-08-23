import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//
// Constant for sizes to be used in the app with respecting 8 pixel rules
class AppSizes {
  //
  // Sizes that related with width
  static final w2 = 2.0.w;
  static final w4 = 4.0.w;
  static final w8 = 8.0.w;
  static final w12 = 12.0.w;
  static final w16 = 16.0.w;
  static final w20 = 20.0.w;
  static final w24 = 24.0.w;
  static final w28 = 28.0.w;
  static final w32 = 32.0.w;
  static final w36 = 36.0.w;
  static final w40 = 40.0.w;
  static final w48 = 48.0.w;
  static final w52 = 52.0.w;
  static final w56 = 56.0.w;
  static final w64 = 64.0.w;
  static final w72 = 72.0.w;
  static final w80 = 80.0.w;
  static final w96 = 96.0.w;

  //
  // Sizes that related with height
  static final h4 = 4.0.h;
  static final h8 = 8.0.h;
  static final h12 = 12.0.h;
  static final h16 = 16.0.h;
  static final h20 = 20.0.h;
  static final h24 = 24.0.h;
  static final h28 = 28.0.h;
  static final h32 = 32.0.h;
  static final h36 = 36.0.h;
  static final h40 = 40.0.h;
  static final h48 = 48.0.h;
  static final h52 = 52.0.h;
  static final h56 = 56.0.h;
  static final h64 = 64.0.h;
  static final h72 = 72.0.h;
  static final h80 = 80.0.h;
  static final h96 = 96.0.h;

  /// Sizes for custom width or height outside the 8 pixel rules
  static double w(double value) => value.w;

  static double h(double value) => value.h;
}

/// Constant for gaps to be used in the app with respecting 8 pixel rules
class Gap {
  /// Gaps that related with width
  static final w4 = SizedBox(width: AppSizes.w4);
  static final w8 = SizedBox(width: AppSizes.w8);
  static final w12 = SizedBox(width: AppSizes.w12);
  static final w16 = SizedBox(width: AppSizes.w16);
  static final w20 = SizedBox(width: AppSizes.w20);
  static final w24 = SizedBox(width: AppSizes.w24);
  static final w28 = SizedBox(width: AppSizes.w28);
  static final w32 = SizedBox(width: AppSizes.w32);
  static final w36 = SizedBox(width: AppSizes.w36);
  static final w40 = SizedBox(width: AppSizes.w40);
  static final w48 = SizedBox(width: AppSizes.w48);
  static final w52 = SizedBox(width: AppSizes.w52);
  static final w56 = SizedBox(width: AppSizes.w56);
  static final w64 = SizedBox(width: AppSizes.w64);
  static final w72 = SizedBox(width: AppSizes.w72);
  static final w80 = SizedBox(width: AppSizes.w80);

  /// Gaps that related with height
  static final h4 = SizedBox(height: AppSizes.h4);
  static final h8 = SizedBox(height: AppSizes.h8);
  static final h12 = SizedBox(height: AppSizes.h12);
  static final h16 = SizedBox(height: AppSizes.h16);
  static final h20 = SizedBox(height: AppSizes.h20);
  static final h24 = SizedBox(height: AppSizes.h24);
  static final h28 = SizedBox(height: AppSizes.h28);
  static final h32 = SizedBox(height: AppSizes.h32);
  static final h36 = SizedBox(height: AppSizes.h36);
  static final h40 = SizedBox(height: AppSizes.h40);
  static final h48 = SizedBox(height: AppSizes.h48);
  static final h52 = SizedBox(height: AppSizes.h52);
  static final h56 = SizedBox(height: AppSizes.h56);
  static final h64 = SizedBox(height: AppSizes.h64);
  static final h72 = SizedBox(height: AppSizes.h72);
  static final h80 = SizedBox(height: AppSizes.h80);

  /// Gaps for custom width or height outside the 8 pixel rules
  static SizedBox gapW(double value) => SizedBox(width: value.w);

  static SizedBox gapH(double value) => SizedBox(height: value.h);

  /// to get BuildContext.viewPadding.bottom
  /// used for give the empty space to fill the Bottom Outside SafeArea
  static dynamic bottomPadding(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    return gapH(bottomPadding);
  }
}

final horizontalPadding = EdgeInsets.symmetric(horizontal: AppSizes.w28);

final horizontalPaddingSmall = EdgeInsets.symmetric(horizontal: AppSizes.w12);
