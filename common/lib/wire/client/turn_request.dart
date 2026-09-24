import 'package:freezed_annotation/freezed_annotation.dart';

import '../../catalog/homeward_catalog.dart';
import '../a2a/a2a_message.dart';
import '../a2a/a2a_part.dart';
import '../a2a/a2a_role.dart';
import '../a2a/client_action.dart';
import '../../story/story_reason.dart';
import '../a2ui_extension.dart';
import '../homeward_metadata.dart';

part 'turn_request.freezed.dart';

@freezed
sealed class TurnRequest with _$TurnRequest {
  const TurnRequest._();

  const factory TurnRequest.text(String text, {StoryReason? reason}) =
      TextTurnRequest;

  const factory TurnRequest.action(
    ClientAction action, {
    required Map<String, Object?> surfaceData,
  }) = ActionTurnRequest;

  A2aMessage message({required String sessionId, required String messageId}) =>
      A2aMessage(
        role: A2aRole.user,
        messageId: messageId,
        contextId: sessionId,
        parts: [
          switch (this) {
            TextTurnRequest(:final text) => A2aPart.text(text: text),
            ActionTurnRequest(:final action) => A2aPart.data(
              data: {
                'version': A2uiExtension.version,
                'action': action.toJson(),
              },
            ),
          },
        ],
        metadata: {
          A2uiExtension.capabilitiesKey: {
            A2uiExtension.version: {
              'supportedCatalogIds': [homewardCatalogId],
            },
          },
          if (this case TextTurnRequest(:final reason?))
            HomewardMetadata.storyReason: reason.name,
          if (this case ActionTurnRequest(:final action, :final surfaceData))
            A2uiExtension.dataModelKey: {
              'version': A2uiExtension.version,
              'surfaces': {action.surfaceId: surfaceData},
            },
        },
      );
}
