String unfinishedReplyInput({required bool words, required bool screen}) => [
  'Server note, never repeat it to the buyer: your reply is not finished. '
      'Do not call a tool.',
  if (words)
    'It has no words for the buyer. Write one to three sentences now that '
        'say what you worked out and, if you need something from them, '
        'what you ask.',
  if (screen)
    'It drew nothing, though your tools handed you components under draw. '
        'Send them on the plan now: its createSurface, then its components '
        'from root. If your text asks the buyer for something, send that '
        'inline ask too.',
  if (screen && !words) 'Send only those messages, and write no more text.',
  if (words && !screen)
    'Write only those sentences; the screen is already drawn.',
].join('\n');
