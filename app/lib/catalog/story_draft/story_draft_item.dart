import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'story_answers.dart';
import 'story_draft_view.dart';

final storyDraftItem = catalogItemFor(const StoryDraft(), (itemContext) {
  final data = itemContext.data as JsonMap;
  final dataContext = itemContext.dataContext;
  final segments =
      jsonModelsOf(data['segments'], StorySegment.fromJson) ?? const [];

  void write(String path, Object? value) =>
      writeBinding(dataContext, {'path': '/story/$path'}, value);

  return BoundParsed<StoryAnswers>(
    dataContext: dataContext,
    value: data['story'],
    parse: StoryAnswers.of,
    builder: (context, answers) {
      final current = answers ?? const StoryAnswers();
      return StoryDraftView(
        segments: segments,
        answers: current,
        onMode: (mode) => write('mode', [mode.name]),
        onMaxMinutes: (minutes) => write('maxMinutes', minutes),
        onStance: (kind, stance) {
          final picks = {...current.picks};
          final mustHaves = {...current.mustHaves};
          switch (stance) {
            case CriterionStance.matters:
              picks.add(kind);
              mustHaves.remove(kind);
            case CriterionStance.must:
              picks.add(kind);
              mustHaves.add(kind);
            case CriterionStance.leftOut:
              picks.remove(kind);
              mustHaves.remove(kind);
          }
          write('picks/${kind.group.name}', [
            for (final other in CriterionKind.values)
              if (other.group == kind.group && picks.contains(other))
                other.name,
          ]);
          write('mustHaves', [for (final must in mustHaves) must.name]);
        },
        onPin: (id, pin) => write('pins/$id', pin.toJson()),
      );
    },
  );
});
