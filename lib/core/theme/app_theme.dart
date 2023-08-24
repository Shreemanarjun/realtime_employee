import 'package:flutter/material.dart';

///This class defines light theme and dark theme
///Here we used flex color scheme
class Themes {
  static ThemeData get theme => ThemeData.light(
        useMaterial3: false,
      );
  //
  //
  // FlexThemeData.light(
  //       scheme: FlexScheme.sanJuanBlue,
  //       surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  //       blendLevel: 20,
  //       appBarOpacity: 0.95,
  //       swapColors: true,
  //       tabBarStyle: FlexTabBarStyle.forBackground,

  //       subThemesData: const FlexSubThemesData(
  //         blendOnLevel: 20,
  //         blendOnColors: false,
  //         inputDecoratorRadius: 8,
  //       ),
  //       keyColors: const FlexKeyColors(
  //         useSecondary: true,
  //         useTertiary: true,
  //       ),
  //       pageTransitionsTheme: const PageTransitionsTheme(
  //         builders: {
  //           // replace default CupertinoPageTransitionsBuilder with this
  //           TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
  //           TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
  //         },
  //       ),
  //       visualDensity: FlexColorScheme.comfortablePlatformDensity,
  //       useMaterial3: false,

  //       /// fontFamily: GoogleFonts.getFont('Lato').fontFamily,

  //       ///
  //     );
  static ThemeData get darkTheme => ThemeData.dark(
        useMaterial3: false,
      );

  //  FlexThemeData.dark(
  //       scheme: FlexScheme.brandBlue,
  //       surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  //       blendLevel: 15,
  //       appBarStyle: FlexAppBarStyle.background,
  //       appBarOpacity: 0.90,
  //       tabBarStyle: FlexTabBarStyle.forBackground,
  //       subThemesData: const FlexSubThemesData(
  //         blendOnLevel: 30,
  //         inputDecoratorRadius: 8,
  //       ),
  //       keyColors: const FlexKeyColors(
  //         useSecondary: true,
  //         useTertiary: true,
  //       ),
  //       pageTransitionsTheme: const PageTransitionsTheme(
  //         builders: {
  //           // replace default CupertinoPageTransitionsBuilder with this
  //           TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
  //           TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
  //         },
  //       ),
  //       visualDensity: FlexColorScheme.comfortablePlatformDensity,
  //       useMaterial3: false,
  //       // To use the playground font, add GoogleFonts package and uncomment
  //       // fontFamily: GoogleFonts.getFont('Lato').fontFamily,
  //     );
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
}
