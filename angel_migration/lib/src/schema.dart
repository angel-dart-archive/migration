import 'package:angel_orm/angel_orm.dart';
import 'table.dart';

abstract class Schema {
  void drop(String tableName);

  void dropAll(Iterable<String> tableNames) {
    tableNames.forEach(drop);
  }

  void ifExists(String tableName, void callback(Schema schema));

  void ifNotExists(String tableName, void callback(Schema schema));

  void create(String tableName, void callback(Table table));

  void update(String tableName, void callback(Table table));
}
