import 'package:freezed_annotation/freezed_annotation.dart';

import '../geo/geo_point.dart';
import '../money/money.dart';
import '../samples/area_option.dart';
import '../samples/home_style.dart';
import '../samples/home_need.dart';
import '../samples/home_type.dart';
import '../samples/listing_read.dart';
import '../samples/outdoor_space.dart';
import 'anchor.dart';
import 'candidate.dart';
import 'case_facet.dart';
import 'criterion.dart';
import 'story_reason.dart';
import 'travel_mode.dart';

part 'story.freezed.dart';
part 'story.g.dart';

@freezed
abstract class Story with _$Story {
  const factory Story({
    StoryReason? reason,
    String? city,
    GeoPoint? cityPoint,
    TravelMode? mode,
    int? maxMinutes,
    @Default([]) List<Anchor> anchors,
    @Default([]) List<Candidate> candidates,
    @Default([]) List<Criterion> criteria,
    @Default(false) bool committed,
    String? chosenCandidateId,
    int? adults,
    List<int>? childAges,
    HomeType? homeType,
    OutdoorSpace? outdoor,
    HomeStyle? style,
    int? rooms,
    @Default([]) List<String> areaIds,
    Money? priceMax,
    String? sampleCity,
    @Default([]) List<AreaOption> areaOptions,
    @Default([]) List<HomeNeed> needs,
    @Default([]) List<ListingRead> readings,
    @Default([]) List<CaseFacet> answered,
    @Default(0) int questions,
  }) = _Story;

  const Story._();

  factory Story.fromJson(Map<String, Object?> json) => _$StoryFromJson(json);

  Anchor? anchorWith(String? id) =>
      anchors.where((anchor) => anchor.id == id).firstOrNull;

  Candidate? candidateWith(String? id) =>
      candidates.where((candidate) => candidate.id == id).firstOrNull;

  Candidate? get chosen => candidateWith(chosenCandidateId);

  Story answering(Iterable<CaseFacet> facets) =>
      copyWith(answered: {...answered, ...facets}.toList());
}
