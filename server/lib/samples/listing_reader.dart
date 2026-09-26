import 'package:common/common.dart';

import '../research/researcher.dart';

const _instruction = '''
You read the descriptions of homes for sale for what a buyer needs the home itself to have.

For every listing and every need, answer:
- `meets` when the description says the home has it,
- `fails` when the description says it lacks it, or describes something that rules it out,
- `silent` when the description says nothing either way.

For `meets` and `fails`, quote the sentence or clause that decides it, copied from the description character for character. For `silent`, leave the quote empty. Judge only from the words of the description: never from the year, the style, or what homes like it usually have.''';

final class ListingReader {
  final _read = <(String, HomeNeed), ListingRead>{};

  Future<List<ListingRead>> read(
    List<Listing> listings,
    List<HomeNeed> needs,
    Researcher researcher,
  ) async {
    final unread = [
      for (final listing in listings)
        if (needs.any((need) => !_read.containsKey((listing.id, need))))
          listing,
    ];
    if (unread.isNotEmpty) {
      final answer = await researcher.answer(
        instruction: _instruction,
        question: _question(unread, needs),
        schema: _schema(unread, needs),
      );
      final answered = {
        for (final reading in answer['readings'] as List<Object?>? ?? const [])
          if (reading case {
            'listingId': final String listingId,
            'need': final String need,
          })
            (listingId, need): reading as Map<String, Object?>,
      };
      for (final listing in unread) {
        for (final need in needs) {
          _read[(listing.id, need)] = verifiedRead(
            listing,
            need,
            answered[(listing.id, need.name)],
          );
        }
      }
    }
    return [
      for (final listing in listings)
        for (final need in needs) _read[(listing.id, need)]!,
    ];
  }
}

ListingRead verifiedRead(
  Listing listing,
  HomeNeed need,
  Map<String, Object?>? answer,
) {
  final silent = ListingRead(
    listingId: listing.id,
    need: need,
    verdict: ReadVerdict.silent,
  );
  final verdict = ReadVerdict.values
      .where((verdict) => verdict.name == answer?['verdict'])
      .firstOrNull;
  if (verdict == null || verdict == ReadVerdict.silent) {
    return silent;
  }
  final quote = quoteIn(listing.description, answer?['quote']);
  return quote == null
      ? silent
      : ListingRead(
          listingId: listing.id,
          need: need,
          verdict: verdict,
          quote: quote,
        );
}

String? quoteIn(String description, Object? quote) {
  if (quote is! String) {
    return null;
  }
  final wanted = quote.trim().replaceAll(RegExp(r'^["“]+|["”.,;:]+$'), '');
  if (wanted.length < 8) {
    return null;
  }
  final at = description.toLowerCase().indexOf(wanted.toLowerCase());
  return at == -1 ? null : description.substring(at, at + wanted.length);
}

String _question(List<Listing> listings, List<HomeNeed> needs) => [
  'Needs:',
  for (final need in needs) '- ${need.name}: ${need.meaning}',
  '',
  'Listings:',
  for (final listing in listings) ...[
    '',
    '[${listing.id}]',
    listing.description,
  ],
].join('\n');

Map<String, Object?> _schema(List<Listing> listings, List<HomeNeed> needs) => {
  'type': 'object',
  'properties': {
    'readings': {
      'type': 'array',
      'items': {
        'type': 'object',
        'properties': {
          'listingId': {
            'type': 'string',
            'enum': [for (final listing in listings) listing.id],
          },
          'need': {
            'type': 'string',
            'enum': [for (final need in needs) need.name],
          },
          'verdict': {
            'type': 'string',
            'enum': [for (final verdict in ReadVerdict.values) verdict.name],
          },
          'quote': {'type': 'string'},
        },
        'required': ['listingId', 'need', 'verdict', 'quote'],
      },
    },
  },
  'required': ['readings'],
};
