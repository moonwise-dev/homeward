import 'package:common/common.dart';

import '../research/step_labels.dart';
import '../samples/listing_reader.dart';
import 'agent_tool.dart';

final class ReadListingsTool extends AgentTool {
  const ReadListingsTool(this._reader);

  final ListingReader _reader;

  @override
  String get name => 'read_listings';

  @override
  Map<String, Object?>? settledArguments(ToolContext context) {
    final story = context.plan.story;
    if (story.needs.isEmpty || context.researcher == null) {
      return null;
    }
    final read = {
      for (final reading in story.readings) (reading.listingId, reading.need),
    };
    return _listingsOf(context).any(
          (listing) =>
              story.needs.any((need) => !read.contains((listing.id, need))),
        )
        ? const {}
        : null;
  }

  @override
  Future<ToolResult> run(
    Map<String, Object?> arguments,
    ToolContext context,
  ) async {
    final plan = context.plan;
    final story = plan.story;
    final listings = _listingsOf(context);
    final city = context.markets.samples.city(story.sampleCity)!;
    final readings = await context.steps.track(
      readingLabel(city.name, listings.length, story.needs),
      () => _reader.read(listings, story.needs, context.researcher!),
    );
    final fresh = {
      for (final reading in readings) (reading.listingId, reading.need),
    };
    return ToolResult(
      modelResult: {
        'listings': listings.length,
        'needs': {
          for (final need in story.needs)
            need.name: {
              for (final verdict in ReadVerdict.values)
                verdict.name: readings
                    .where(
                      (reading) =>
                          reading.need == need && reading.verdict == verdict,
                    )
                    .length,
            },
        },
      },
      plan: plan.copyWith(
        story: story.copyWith(
          readings: [
            for (final reading in story.readings)
              if (!fresh.contains((reading.listingId, reading.need))) reading,
            ...readings,
          ],
        ),
      ),
    );
  }

  List<Listing> _listingsOf(ToolContext context) =>
      switch (context.plan.story.sampleCity) {
        final city? => context.markets.samples.listingsIn(city),
        null => const [],
      };
}
