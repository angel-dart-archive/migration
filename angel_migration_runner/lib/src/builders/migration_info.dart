import 'dart:async';
import 'dart:convert';
import 'package:angel_migration/angel_migration.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

/// Builds `.migration_info.json` files, which tell `package:angel_migration_runner`
/// where to find migration files.
class MigrationInfoBuilder implements Builder {
  static const TypeChecker migrationTypeChecker =
      const TypeChecker.fromRuntime(Migration);

  const MigrationInfoBuilder();

  @override
  Map<String, List<String>> get buildExtensions {
    return {
      '.dart': ['.migration_info.json']
    };
  }

  @override
  Future<void> build(BuildStep buildStep) async {
    var inputId = buildStep.inputId;

    if (await buildStep.resolver.isLibrary(inputId)) {
      var libraryReader = await buildStep.resolver
          .libraryFor(inputId)
          .then((el) => LibraryReader(el));
      var migrationClasses = libraryReader.classes
          .where((el) => migrationTypeChecker.isAssignableFromType(el.type));

      if (migrationClasses.isNotEmpty) {
        var migrationInfo = {
          inputId.toString(): migrationClasses.map((c) => c.name).toList(),
        };

        buildStep.writeAsString(inputId.changeExtension('.migration_info.json'),
            json.encode(migrationInfo));
      }
    }
  }
}
