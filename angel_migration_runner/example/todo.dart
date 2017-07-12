import 'package:angel_migration/angel_migration.dart';
import 'package:angel_migration_runner/src/schema.dart';
import '../../angel_migration/example/todo.dart';

main() {
  var schema = new PostgresSchema.root();

  for (Migration migration in [new UserMigration(), new TodoMigration()]) {
    migration.up(schema);
  }

  print(schema.compile());
}
