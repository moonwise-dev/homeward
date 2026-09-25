import 'case_facet.dart';
import 'story.dart';
import 'story_reason.dart';

const maxCaseQuestions = 5;

const essentialCaseGaps = {
  CaseFacet.place,
  CaseFacet.household,
  CaseFacet.homeType,
  CaseFacet.area,
};

List<CaseFacet> caseGaps(Story story) => [
  if (_needsPlace(story)) CaseFacet.place,
  if (story.adults == null) CaseFacet.household,
  if (story.homeType == null) CaseFacet.homeType,
  if (story.sampleCity != null &&
      story.candidates.isEmpty &&
      story.areaIds.isEmpty)
    CaseFacet.area,
  if (story.anchors.any((anchor) => anchor.point != null) &&
      !story.answered.contains(CaseFacet.mode))
    CaseFacet.mode,
  if (story.outdoor == null) CaseFacet.outdoor,
  if (story.style == null) CaseFacet.style,
];

bool caseQuestionsOpen(Story story) =>
    story.questions < maxCaseQuestions &&
    caseGaps(story).any(essentialCaseGaps.contains);

bool _needsPlace(Story story) =>
    const {StoryReason.work, StoryReason.study}.contains(story.reason) &&
    !story.anchors.any((anchor) => anchor.point != null);
