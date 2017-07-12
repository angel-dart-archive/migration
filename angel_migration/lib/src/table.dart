import 'package:angel_orm/angel_orm.dart';
import 'column.dart';

abstract class Table {
  MigrationColumn declareColumn(String name, Column column);

  MigrationColumn declare(String name, ColumnType type) =>
      declareColumn(name, new MigrationColumn(type));

  MigrationColumn serial(String name) => declare(name, ColumnType.SERIAL);

  MigrationColumn integer(String name) => declare(name, ColumnType.INT);

  MigrationColumn boolean(String name) => declare(name, ColumnType.SERIAL);

  MigrationColumn date(String name) => declare(name, ColumnType.SERIAL);

  MigrationColumn dateTime(String name) => declare(name, ColumnType.SERIAL);

  MigrationColumn text(String name) => declare(name, ColumnType.SERIAL);

  MigrationColumn varchar(String name, {int length}) {
    if (length == null) return declare(name, ColumnType.VAR_CHAR);
    return declareColumn(
        name, new Column(type: ColumnType.VAR_CHAR, length: length));
  }
}