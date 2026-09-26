const basicComponentSummaries = {
  'Text': 'Text, with simple Markdown and a style variant such as a heading',
  'Row': 'Lays out its children side by side',
  'Column': 'Stacks its children vertically',
  'Card': 'A raised container around one child',
  'Divider': 'A thin line between content',
  'List':
      'A list of children, vertical or horizontal, fixed or from a template',
  'Tabs': 'Tabs, each with a title and one child',
  'Icon': 'An icon from the basic icon set, by name',
  'Button': 'A button with a child as its label, which sends an action',
  'CheckBox': 'A labelled checkbox bound to true or false',
  'ChoicePicker': 'Options to pick one or several of, as checkboxes or chips, bound to a list',
  'TextField': 'A labelled text input, short, long, numeric, or obscured',
  'DateTimeInput': 'A labelled date, time, or both, in ISO 8601',
};

final agentVisibleBasicComponents = basicComponentSummaries.keys.toSet();
