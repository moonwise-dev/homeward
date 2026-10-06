String unfinishedReplyInput({
  required bool plan,
  required bool ask,
  required bool words,
}) => [
  'Server note, never repeat it to the buyer: your reply is not finished.',
  if (words)
    'It has no words for the buyer. Write one to three sentences now that '
        'say what their answer changes and what you ask next.',
  if (plan)
    'It drew no plan panel. Send the plan now: its createSurface, then its '
        'components from root, a PlanOverview with the story and steps as '
        'they stand, and a Brief with an answer action.',
  if (ask)
    'It drew no inline ask. Send this turn\'s inline ask now: its '
        'createSurface, then one Choice or one Questions that asks what '
        'your text asks.',
  if (plan || ask)
    'Send only ${words ? 'those sentences and ' : ''}those messages'
        '${words ? '' : ', and write no more text'}.'
  else
    'Write only those sentences; the screen is already drawn.',
].join('\n');
