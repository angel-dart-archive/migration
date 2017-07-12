import 'package:angel_orm/angel_orm.dart';
import 'table.dart';

abstract class Schema {
  void drop(String tableName);

  void dropAll(Iterable<String> tableNames) {
    tableNames.forEach(drop);
  }

  void create(String tableName, void callback(Table table));

  void createIfNotExists(String tableName, void callback(Table table));

  void alter(String tableName, void callback(Table table));
}
