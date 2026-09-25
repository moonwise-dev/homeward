enum SurfaceAction {
  answer(
    'answer',
    ['facet', 'value', 'label'],
    "The buyer answers one of the detective's questions with a tap; the app "
        'adds the facet, the value, and the label of what was tapped, and the '
        'server folds it into the story.',
  ),
  commitStory(
    'commit_story',
    ['storyPath'],
    'The buyer confirms the case summary they corrected, pins included; the '
        'server picks the sample homes that fit, where the city has them, and '
        'measures every home against the story.',
  ),
  chooseHome(
    'choose_home',
    ['candidateId'],
    'The buyer picks the home to work out the deal for.',
  ),
  selectMarket('select_market', ['marketId'], 'The buyer picked a market.'),
  commitProfile(
    'commit_profile',
    ['profilePath'],
    'The buyer saves the profile form; the server validates and stores it.',
  ),
  commitScenario(
    'commit_scenario',
    ['scenarioPath'],
    'The buyer keeps a scenario; the server checks it against the rules.',
  ),
  change(
    'change',
    ['section'],
    'The buyer reopens a decision: the story, the home, the market, or the '
        'scenario.',
  ),
  explain(
    'explain',
    ['topic', 'path'],
    'The buyer asks why a figure or rule is what it is.',
  ),
  compareLoanTypes(
    'compare_loan_types',
    ['scenarioPath'],
    'The buyer asks how the loan types compare for a scenario.',
  );

  const SurfaceAction(this.wireName, this.contextKeys, this.purpose);

  final String wireName;
  final List<String> contextKeys;
  final String purpose;

  static final Set<String> wireNames = {
    for (final action in values) action.wireName,
  };

  static SurfaceAction? named(String wireName) {
    for (final action in values) {
      if (action.wireName == wireName) {
        return action;
      }
    }
    return null;
  }
}
