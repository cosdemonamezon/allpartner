import 'package:flutter/material.dart';

class AppTheme extends InheritedWidget {
  final AppThemeData data;

  const AppTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static AppThemeData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>()?.data;
  }
}

class AppThemeData {
  final AppFontSize appFontSize;

  const AppThemeData({
    required this.appFontSize,
  });

  factory AppThemeData.scaled(BuildContext context) {
    final t = _ThemeFontSize();
    final appFontSize = AppFontSize(
      body: t.body(context),
      body2: t.body2(context),
      body3: t.body3(context),
      body4: t.body4(context),
      bigSize: t.bigSize(context),
      title: t.title(context),
      appBarFont: t.appBarFont(context),
      smallFont: t.smallFont(context),
      smallFont1: t.smallFont1(context),
      smallFont2: t.smallFont2(context),
    );
    return AppThemeData(appFontSize: appFontSize);
  }
}

class AppFontSize {
  final double body;
  final double body2;
  final double body3;
  final double body4;
  final double bigSize;
  final double title;
  final double appBarFont;
  final double smallFont;
  final double smallFont1;
  final double smallFont2;

  const AppFontSize({
    required this.body,
    required this.body2,
    required this.body3,
    required this.body4,
    required this.bigSize,
    required this.title,
    required this.appBarFont,
    required this.smallFont,
    required this.smallFont1,
    required this.smallFont2,
  });

  static AppFontSize? of(BuildContext context) {
    return AppTheme.of(context)?.appFontSize;
  }
}

class _ThemeFontSize {
  double body(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (width > 760 || height > 700) {
      return height / (50 * textScaleFactor);
    } else {
      return height / (45 * textScaleFactor);
    }
  }

  double body2(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (width > 760 || height > 700) {
      return height / (55 * textScaleFactor);
    } else {
      return height / (50 * textScaleFactor);
    }
  }

  double body3(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (width > 760 || height > 700) {
      return height / (60 * textScaleFactor);
    } else {
      return height / (55 * textScaleFactor);
    }
  }

  double body4(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (width > 760 || height > 700) {
      return height / (65 * textScaleFactor);
    } else {
      return height / (60 * textScaleFactor);
    }
  }

  double bigSize(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (width > 760 || height > 700) {
      return height / (35 * textScaleFactor);
    } else {
      return height / (30 * textScaleFactor);
    }
  }

  double title(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    if (shortestSide < 550) {
      return 24;
    } else {
      return 36;
    }
  }

  double appBarFont(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (width > 760 || height > 700) {
      return height / (45 * textScaleFactor);
    } else {
      return height / (40 * textScaleFactor);
    }
  }

  double smallFont(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (width > 760 || height > 700) {
      return height / (65 * textScaleFactor);
    } else {
      return height / (57 * textScaleFactor);
    }
  }

  double smallFont1(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (width > 760 || height > 700) {
      return height / (68 * textScaleFactor);
    } else {
      return height / (60 * textScaleFactor);
    }
  }

  double smallFont2(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (width > 760 || height > 700) {
      return height / (73 * textScaleFactor);
    } else {
      return height / (65 * textScaleFactor);
    }
  }
}
