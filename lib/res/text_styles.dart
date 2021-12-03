import 'package:flutter/widgets.dart';

import 'colors.dart';

class ProjectTextStyles {
  // TODO: Hate to break it to you, but we HAVE no style

  static final TextStyle appTitleTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 65,
      color: ProjectColors.darkTextColor);
  static final TextStyle pageTitleTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 35,
      color: ProjectColors.darkTextColor);
  static const TextStyle buttonLargeTextStyle =
      TextStyle(fontSize: 20, color: ProjectColors.lightTextColor);
  static final TextStyle appMiniTitleTextStyle = 
      TextStyle(fontSize: 25, color: ProjectColors.darkTextColor);
}
