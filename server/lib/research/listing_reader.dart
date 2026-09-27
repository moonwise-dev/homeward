import 'package:common/common.dart';

import 'researcher.dart';

const _instruction = '''
You read the descriptions of homes for sale for what a buyer needs the home itself to have.

For every listing and every need, answer:
- `meets` when the description says the home has it,
- `fails` when the description says it lacks it, or describes something that rules it out,
- `silent` when the description says nothing either way.

For `meets` and `fails`, quote the sentence or clause that decides it, copied from the description character for character. For `silent`, leave the quote empty. Judge only from the words of the description: never from the year, the style, or what homes like it usually have.''';

final class ListingReader {
  final _read = <(String, String), (ReadVerdict, String?)>{};

  Future<Map<String, List<NeedReading>>> read(
    List<Listing> listings,
    List<HomeNeed> needs,
    Researcher researcher,
  ) async {
    (String, String) key(Listing listing, HomeNeed need) =>
        (listing.id, need.meaning.trim().toLowerCase());
    final unread = [
      for (final listing in listings)
        if (needs.any((need) => !_read.containsKey(key(listing, need))))
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
          _read[key(listing, need)] = verifiedRead(
            listing,
            answered[(listing.id, need.id)],
          );
        }
      }
    }
    return {
      for (final listing in listings)
        listing.id: [
          for (final need in needs)
            switch (_read[key(listing, need)]!) {
              (final verdict, final quote) => NeedReading(
                needId: need.id,
                label: need.label,
                verdict: verdict,
                quote: quote,
              ),
            },
        ],
    };
  }
}

(ReadVerdict, String?) verifiedRead(
  Listing listing,
  Map<String, Object?>? answer,
) {
  final verdict = ReadVerdict.values
      .where((verdict) => verdict.name == answer?['verdict'])
      .firstOrNull;
  if (verdict == null || verdict == ReadVerdict.silent) {
    return (ReadVerdict.silent, null);
  }
  return switch (quoteIn(listing.description, answer?['quote'])) {
    final quote? => (verdict, quote),
    null => (ReadVerdict.silent, null),
  };
}

String _question(List<Listing> listings, List<HomeNeed> needs) => [
  'Needs:',
  for (final need in needs) '- ${need.id}: ${need.meaning}',
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
            'enum': [for (final need in needs) need.id],
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
