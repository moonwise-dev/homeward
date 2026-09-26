import 'case_facet.dart';
import 'story.dart';
import 'story_reason.dart';

const maxCaseQuestions = 6;

const essentialCaseGaps = {
  CaseFacet.place,
  CaseFacet.household,
  CaseFacet.needs,
  CaseFacet.routine,
  CaseFacet.homeType,
  CaseFacet.area,
};

List<CaseFacet> caseGaps(Story story) => [
  if (_needsPlace(story)) CaseFacet.place,
  if (story.adults == null) CaseFacet.household,
  if (_pointsAtNeeds(story)) CaseFacet.needs,
  if (story.anchors.any((anchor) => anchor.point != null) &&
      !story.answered.contains(CaseFacet.routine))
    CaseFacet.routine,
  if (story.homeType == null && !story.answered.contains(CaseFacet.swipe))
    CaseFacet.homeType,
  if (story.sampleCity != null &&
      story.candidates.isEmpty &&
      story.areaIds.isEmpty)
    CaseFacet.area,
  if (story.anchors.any((anchor) => anchor.point != null) &&
      !story.answered.contains(CaseFacet.mode))
    CaseFacet.mode,
  if (story.outdoor == null && !story.answered.contains(CaseFacet.swipe))
    CaseFacet.outdoor,
  if (story.style == null && !story.answered.contains(CaseFacet.swipe))
    CaseFacet.style,
];

List<CaseFacet> caseMustAsk(Story story) => [
  if (caseQuestionsOpen(story))
    for (final gap in caseGaps(story))
      if (essentialCaseGaps.contains(gap)) gap,
];

bool caseQuestionsOpen(Story story) =>
    story.questions < maxCaseQuestions &&
    caseGaps(story).any(essentialCaseGaps.contains);

bool _pointsAtNeeds(Story story) =>
    !story.answered.contains(CaseFacet.needs) &&
    ((story.adults ?? 0) >= 3 || story.reason == StoryReason.family);

bool _needsPlace(Story story) =>
    const {StoryReason.work, StoryReason.study}.contains(story.reason) &&
    !story.anchors.any((anchor) => anchor.point != null);
