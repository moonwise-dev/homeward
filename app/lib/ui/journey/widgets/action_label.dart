import 'package:common/common.dart';

String surfaceActionLabel(String wireName) =>
    switch (SurfaceAction.named(wireName)) {
      SurfaceAction.commitStory => 'That is what matters to us',
      SurfaceAction.chooseHome => 'Chose this home',
      SurfaceAction.selectMarket => 'Chose the market',
      SurfaceAction.commitProfile => 'Saved my details',
      SurfaceAction.commitScenario => 'Kept this scenario',
      SurfaceAction.change => 'Reopened a decision',
      SurfaceAction.explain => 'Asked why',
      SurfaceAction.compareLoanTypes => 'Asked to compare loan types',
      null => 'Answered the form',
    };
