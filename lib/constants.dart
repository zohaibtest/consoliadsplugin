enum PlaceholderName{
  Default,
  MainMenu,
  SelectionScene,
  FinalScene,
  OnSuccess,
  OnFailure,
  OnPause,
  StoreScene,
  Gameplay,
  MidScene1,
  MidScene2,
  MidScene3,
  AppExit,
  LoadingScene1,
  LoadingScene2,
  onReward,
  SmartoScene,
  Activity1,
  Activity2,
  Activity3,
  Activity4,
  Activity5,
  OptionA,
  OptionB,
  OptionC,
  Settings,
  About
}

extension PlaceholderNameExtensionList on PlaceholderName {
  static const values = [27,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26];
  int get value => values[this.index];
}
