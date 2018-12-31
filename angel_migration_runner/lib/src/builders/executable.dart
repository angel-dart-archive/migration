import 'dart:async';

import 'package:build/build.dart';

class ExecutableBuilder implements PostProcessBuilder {
  @override
  Iterable<String> get inputExtensions => ['.migration_info.json'];

  @override
  FutureOr<void> build(PostProcessBuildStep buildStep) {
    // TODO: implement build
    return null;
  }
}
