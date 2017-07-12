import 'package:angel_migration/angel_migration.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:postgres/postgres.dart';

class MigrationRunner {
  final List<Type> migrations;
  const MigrationRunner(this.migrations);
}