import 'dart:convert';

const toolResultsNote =
    'Server note, never repeat it to the buyer: the cards these tools '
    'handed over under draw are on the plan already. If their message '
    'asks for something no tool has worked out or shown yet, call the '
    'tool for it now, before you write. Otherwise reply with one to three '
    'sentences for the buyer. When those sentences ask them anything, add '
    'the a2ui block with that ask and its buttons right after them.';

const toolsDoneNote =
    'Server note, never repeat it to the buyer: these are the last tool '
    'results of this turn, and no more tools can run until the buyer '
    'answers. The cards they handed over under draw are on the plan '
    'already. Reply now with one to three sentences for the buyer. When '
    'those sentences ask them anything, add the a2ui block with that ask '
    'and its buttons right after them.';

String tapAnsweredInput(String tool, Object? answer) => [
  'Server note, never repeat it to the buyer: this tap already ran '
      '$tool, and no more tools can run until the buyer answers. Its '
      'answer:',
  jsonEncode(answer),
  'The cards it handed over under draw are on the plan already. Reply '
      'now with one or two sentences that say what this means for them, '
      'from what the tools have told you. When there is work worth doing '
      'next that no tool has done, such as homes to see or their week '
      'from a home, offer it: right after your sentences add the a2ui '
      'block with that ask and two or three buttons.',
].join('\n');

String unheardTapsNote(Iterable<String> taps) =>
    'Server note, never repeat it to the buyer: since your last reply '
    'the buyer tapped on the plan, and the server answered each tap '
    "without you: ${taps.join('; ')}. What they opened is on the plan "
    'now, so never show it again; when they ask about it, say what it '
    'means for them.';
