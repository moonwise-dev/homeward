import 'package:common/common.dart';

import '../research/story_measurer.dart';
import 'agent_tool.dart';

final class AssessStoryTool extends AgentTool {
  const AssessStoryTool(this._measurer);

  final StoryMeasurer _measurer;

  @override
  String get name => 'assess_story';

  @override
  Map<String, Object?>? settledArguments(ToolContext context) {
    final story = context.plan.story;
    return story.committed &&
            story.criteria.isNotEmpty &&
            story.candidates.any((candidate) => candidate.point != null)
        ? const {}
        : null;
  }

  @override
  Future<ToolResult> run(
    Map<String, Object?> arguments,
    ToolContext context,
  ) async {
    final story = context.plan.story;
    final assessment = assessStory(story, await _measurer.measure(story));
    return ToolResult(
      modelResult: {
        'homes': [
          for (final candidate in assessment.candidates)
            {
              'id': candidate.id,
              'label': candidate.label,
              'rank': candidate.rank,
              'missesMustHave': candidate.missesMustHave,
              'fits': candidate.pros.length,
              'close': candidate.close.length,
              'misses': candidate.cons.length,
            },
        ],
        'unmeasured': [
          for (final row in assessment.rows)
            if (row.cells.any((cell) => cell.status == FitStatus.unknown))
              row.id,
        ],
      },
      seeds: {assessmentSlice.name: assessment.toJson()},
    );
  }
}
