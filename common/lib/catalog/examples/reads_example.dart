import 'dart:convert';

import '../../samples/listing_reading.dart';
import 'homes_example.dart';

final stockholmReadsDataModel = {
  'reads': {
    _home.id: jsonDecode(
      jsonEncode(
        ListingReading(
          homeId: _home.id,
          homeName: _home.addressLine,
          description: _home.description,
          readings: [
            _read(
              'step-free',
              'No steps for Mum',
              ReadVerdict.meets,
              'The building is step-free from the street',
            ),
            _read(
              'one-floor',
              'Everything on one floor',
              ReadVerdict.fails,
              'a spiral stair leads to a sleeping loft',
            ),
            const NeedReading(
              needId: 'parking',
              label: 'A place to park',
              verdict: ReadVerdict.silent,
            ),
          ],
        ).toJson(),
      ),
    ),
  },
};

final _home = stockholmSampleHomes.first;

NeedReading _read(
  String needId,
  String label,
  ReadVerdict verdict,
  String quote,
) => NeedReading(
  needId: needId,
  label: label,
  verdict: verdict,
  quote: quoteIn(_home.description, quote)!,
);
