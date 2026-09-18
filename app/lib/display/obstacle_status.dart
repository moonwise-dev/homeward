import 'package:common/common.dart';

import '../ui/app_status.dart';

AppStatus obstacleStatus(ObstacleSeverity severity) => switch (severity) {
  ObstacleSeverity.blocker => AppStatus.fail,
  ObstacleSeverity.effort => AppStatus.warn,
  ObstacleSeverity.info => AppStatus.info,
};

String obstacleDetail(Obstacle obstacle, String Function(Period) format) =>
    switch (obstacle.typicalDuration) {
      final duration? => '${obstacle.mitigation} Allow ${format(duration)}.',
      null => obstacle.mitigation,
    };
