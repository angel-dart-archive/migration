import 'package:build/build.dart';
import 'src/builders/migration_info.dart';

Builder migrationInfoBuilder([BuilderOptions options]) =>
    MigrationInfoBuilder();

PostProcessBuilder migrationInfoCleanup(BuilderOptions options) =>
    FileDeletingBuilder(['.migration_info.json'],
        isEnabled: options.config['enabled'] == true);
