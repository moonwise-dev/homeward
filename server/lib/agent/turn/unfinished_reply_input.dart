String unfinishedReplyInput({
  required bool words,
  required bool screen,
  bool notes = false,
}) => [
  'Server note, never repeat it to the buyer: your reply is not finished. '
      'Do not call a tool.',
  if (words && notes)
    'Its text held notes to yourself or code, so it was taken back from '
        'the buyer. Write one to three sentences now, for the buyer and '
        'nothing else, that say what you worked out and, if you need '
        'something from them, what you ask.',
  if (words && !notes)
    'It has no words for the buyer. Write one to three sentences now that '
        'say what you worked out and, if you need something from them, '
        'what you ask.',
  if (screen)
    'It drew nothing, though your tools handed you cards under draw. Send '
        "the plan's updateComponents now, with root alone, naming those "
        'cards by ID in its children. If your text asks the buyer for '
        'something, send that inline ask too.',
  if (screen && !words) 'Send only those messages, and write no more text.',
  if (words && !screen)
    'Write only those sentences; the screen is already drawn.',
].join('\n');
