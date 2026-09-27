Set<String> numbersIn(String text) => {
  for (final match in _written.allMatches(text))
    _writtenValue(match[1]!, match[2]?.toLowerCase()),
  for (final run in _spelledRuns(text.replaceAll(_written, ' ').toLowerCase()))
    '${_valueOf(run)}',
};

final _written = RegExp(
  r"(\d(?:[\d,.' ]*\d)?)(?:\s*(k|m|mn|bn|thousand|million|billion)\b)?",
  caseSensitive: false,
);

String _writtenValue(String digits, String? scale) {
  final plain = digits.replaceAll(RegExp("[ ']"), '');
  final last = plain.lastIndexOf(RegExp('[.,]'));
  final decimal = last != -1 && plain.length - last - 1 != 3;
  final whole = plain
      .substring(0, decimal ? last : plain.length)
      .replaceAll(RegExp('[.,]'), '');
  final fraction = decimal ? plain.substring(last + 1) : '';
  final value =
      num.parse(fraction.isEmpty ? whole : '$whole.$fraction') *
      switch (scale) {
        'k' || 'thousand' => 1000,
        'm' || 'mn' || 'million' => 1000000,
        'bn' || 'billion' => 1000000000,
        _ => 1,
      };
  return value == value.roundToDouble() ? '${value.round()}' : '$value';
}

List<List<int>> _spelledRuns(String text) {
  final tokens = [
    for (final match in RegExp('[a-z]+').allMatches(text)) match[0]!,
  ];
  final runs = <List<int>>[];
  List<int>? run;
  for (final (index, token) in tokens.indexed) {
    final value = _words[token];
    if (value == null) {
      final next = index + 1 < tokens.length ? _words[tokens[index + 1]] : null;
      if (token != 'and' || run == null || run.last < 100 || next == null) {
        run = null;
      }
    } else if (run != null && _continues(run.last, value)) {
      run.add(value);
    } else {
      runs.add(run = [value]);
    }
  }
  return runs;
}

bool _continues(int previous, int value) =>
    value >= 100 ||
    previous >= 100 ||
    (previous >= 20 && previous % 10 == 0 && value < 10);

int _valueOf(List<int> values) {
  var total = 0;
  var current = 0;
  for (final value in values) {
    if (value == 100) {
      current = (current == 0 ? 1 : current) * 100;
    } else if (value >= 1000) {
      total += (current == 0 ? 1 : current) * value;
      current = 0;
    } else {
      current += value;
    }
  }
  return total + current;
}

const _words = {
  'zero': 0,
  'two': 2,
  'three': 3,
  'four': 4,
  'five': 5,
  'six': 6,
  'seven': 7,
  'eight': 8,
  'nine': 9,
  'ten': 10,
  'eleven': 11,
  'twelve': 12,
  'thirteen': 13,
  'fourteen': 14,
  'fifteen': 15,
  'sixteen': 16,
  'seventeen': 17,
  'eighteen': 18,
  'nineteen': 19,
  'twenty': 20,
  'thirty': 30,
  'forty': 40,
  'fifty': 50,
  'sixty': 60,
  'seventy': 70,
  'eighty': 80,
  'ninety': 90,
  'hundred': 100,
  'thousand': 1000,
  'million': 1000000,
  'billion': 1000000000,
};
