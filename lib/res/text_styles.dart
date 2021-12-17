import 'package:flutter/widgets.dart';

import 'colors.dart';

class ProjectTextStyles {
  static final TextStyle appTitleTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 65,
      color: ProjectColors.darkTextColor);
  static final TextStyle pageTitleTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 35,
      color: ProjectColors.darkTextColor);
  static final TextStyle pageTitle2TextStyle =
      TextStyle(fontSize: 32, color: ProjectColors.darkTextColor);
  static const TextStyle buttonStandardTextStyle =
      TextStyle(fontSize: 20, color: ProjectColors.lightTextColor);
  static const TextStyle buttonLargeTextStyle =
      TextStyle(fontSize: 24, color: ProjectColors.lightTextColor);
  static final TextStyle appMiniTitleTextStyle =
      TextStyle(fontSize: 25, color: ProjectColors.darkTextColor);
  static final TextStyle playerScoreTextStyle =
      TextStyle(fontSize: 32, color: ProjectColors.darkTextColor);
  static final TextStyle playerScoreHintTextStyle =
      TextStyle(fontSize: 15, color: ProjectColors.darkTextColor);
  static const TextStyle playerScoreInputTextStyle =
      TextStyle(fontSize: 65, color: ProjectColors.blackTextColor);
  static final TextStyle playerScoreInputLabelTextStyle =
      TextStyle(fontSize: 22, color: ProjectColors.darkTextColor);
  static const TextStyle gameListTitleTextStyle =
      TextStyle(fontSize: 20, color: ProjectColors.lightTextColor);
}
