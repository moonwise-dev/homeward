import 'package:common/common.dart';
import 'package:homeward_server/tools/propose_profile_tool.dart';
import 'package:homeward_server/tools/propose_scenario_tool.dart';
import 'package:homeward_server/tools/slice_parameters.dart';
import 'package:test/test.dart';

void main() {
  Map<String, Object?> properties(Map<String, Object?> parameters) =>
      parameters['properties']! as Map<String, Object?>;

  test('profile proposals accept every profile field in tool shapes', () {
    final profile = properties(const ProposeProfileTool().parameters);

    expect(profile.keys, [for (final field in profileSlice.fields) field.name]);
    expect(profile['use'], {
      'type': 'string',
      'enum': ['primary', 'secondary', 'investment'],
      'description': 'How the buyer will use the home.',
    });
    expect(profile['taxResidence'], {
      'type': 'string',
      'description':
          'Country the buyer pays tax in. ISO 3166-1 alpha-2 country code.',
    });
    expect(
      (profile['savings']! as Map<String, Object?>)['required'],
      ['amount'],
    );
    expect(profile['childAges'], containsPair('type', 'array'));
  });

  test('scenario proposals take only what a buyer states', () {
    final parameters = const ProposeScenarioTool().parameters;

    expect(properties(parameters).keys, [
      'price',
      'downPayment',
      'termYears',
      'loanTypeId',
      'associationFee',
    ]);
    expect(parameters['required'], ['price']);
  });

  test('omits required when nothing is required', () {
    expect(sliceParameters(selectionSlice, only: {'marketId'}), {
      'type': 'object',
      'properties': {
        'marketId': {
          'type': 'string',
          'description':
              'The market picked in a LocationPicker in market mode. ISO 3166 '
              'code of a country or subdivision, such as SE or PT-30.',
        },
      },
    });
  });
}
