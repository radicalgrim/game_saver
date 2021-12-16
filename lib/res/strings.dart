class ProjectStrings {
  //Global
  static const String error = 'Error';
  static const String ok = 'OK';
  static const String nextButton = "Continue";

  // Home Page
  static const String appTitle = "GameSaver";
  static const String newGameButton = "New Game";
  static const String scoreboardsButton = "Scoreboards";

  // Scoreboard page
  static const String scoreboardHeader = scoreboardsButton;
  static const String scoreboardPreviousGames = "Game Winners";

  // Add Players Page
  static const String addPlayersHeading = "Add Your Players";
  static const String addPlayerHint = "Add Player";
  static const String addPlayersErrorMessage =
      "Game must have at least 1 participant";
  static const String addPlayersMaxErrorMessage =
      "Game cannot have more than 8 participants";

  // Game Options Page
  static const String gameOptionsHeader = "Game Options";
  static const String gameOptionsTitle = "Options";
  static const String gameOptionDefaultTimerON = "Default Game Timer ON";
  static const String gameOptionDefaultScoreLOW = "Default Game Score LOW";
  static const String gameOptionEndRoundOnPlayer =
      "End Round After Final Player's Turn";
  static const String gameOption4 = "Game Option 4";
  static const String gameOption5 = "Game Option 5";
  static const String gameOption6 = "Game Option 6";
  static const String gameOption7 = "Game Option 7";

  // Game Customizations Page
  static const String gameCustomizationHeader = "Customize Your Game";
  static const String gameCustTitle = "Game Title";
  static const String gameCustStyle = "Scoring Style";
  static const String gameCustReqError = "Game Title is a required field";
  static const String gameCustStartGame = "Start Game";
  static const String gameCustLow = 'Lowest Score Wins';
  static const String gameCustHigh = 'Highest Score Wins';
  static const String gameCustHint = 'e.g. Game Night with the Johnson\'s';
  static const String gameCustReq = 'Game Title *';

  // Round Pages
  static const String roundHeader = "Game Rounds";
  static const String roundNext = "Next Player";
  static const String roundPrevious = "Previous Player";
  static const String roundEnd = "End Round";
  static const String roundInput = "Score:";
  static const String scoreInputHint = "0";
  static const String scoreInputLabel = "Points";

  //End of Round
  static const String eofRoundHeader = "Round Complete";
  static const String eofRoundNext = "Next Round";
  static const String eofRoundChange = "Change Scores";
  static const String eofGameButton = "End Game";

  //End of Game
  static const String eofGameHeader = "Game Complete";
  static const String eofGameTitle = "And the winner is...";
  static const String eofGameNewGame = newGameButton;
  static const String eofGameScoreboards = scoreboardsButton;
}
