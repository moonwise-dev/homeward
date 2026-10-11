String unfinishedReplyInput({required bool notes}) => [
  'Server note, never repeat it to the buyer: your reply is not finished. '
      'Do not call a tool.',
  if (notes)
    'Its text held notes to yourself or code, so it was taken back from '
        'the buyer.'
  else
    'It has no words for the buyer.',
  'Write one to three sentences now, for the buyer and nothing else, that '
      'say what you worked out and, if you need something from them, what '
      'you ask. Write only those sentences; the screen is already drawn.',
].join('\n');

const missingAskInput =
    'Server note, never repeat it to the buyer: your text asks the buyer '
    'something, and you drew nothing for them to tap. Send the a2ui '
    'block with the inline ask for it now, and no sentences: one '
    'updateComponents for a surface named for this turn, whose root is a '
    'Row of Buttons that answer your question, or a Choice, or a '
    'Questions card. Do not call a tool.';
