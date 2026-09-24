import 'package:common/common.dart';

import '../ui/app_status.dart';

AppStatus fitAppStatus(FitStatus status) => switch (status) {
  FitStatus.fits => AppStatus.pass,
  FitStatus.close => AppStatus.warn,
  FitStatus.misses => AppStatus.fail,
  FitStatus.unknown => AppStatus.info,
};
