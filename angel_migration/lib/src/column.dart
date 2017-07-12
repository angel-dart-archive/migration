import 'package:angel_orm/angel_orm.dart';

class MigrationColumn extends Column {
  final List<MigrationColumnReference> _references = [];
  bool _nullable;
  IndexType _index;
  dynamic _defaultValue;

  @override
  bool get nullable => _nullable;

  @override
  IndexType get index => _index;

  @override
  get defaultValue => _defaultValue;

  List<MigrationColumnReference> get externalReferences =>
      new List<MigrationColumnReference>.unmodifiable(_references);

  MigrationColumn(ColumnType type,
      {bool nullable: true, int length, IndexType index, defaultValue})
      : super(type: type, length: length) {
    _nullable = nullable;
    _index = index;
    _defaultValue = defaultValue;
  }

  factory MigrationColumn.from(Column column) => column is MigrationColumn
      ? column
      : new MigrationColumn(column.type,
          nullable: column.nullable,
          length: column.length,
          index: column.index,
          defaultValue: column.defaultValue);

  MigrationColumn notNull() => this.._nullable = false;

  MigrationColumn defaultsTo(value) => this.._defaultValue = value;

  MigrationColumn unique() => this.._index = IndexType.UNIQUE;

  MigrationColumn primaryKey() => this.._index = IndexType.PRIMARY_KEY;

  MigrationColumnReference references(String foreignTable, String foreignKey) {
    var ref = new MigrationColumnReference._(foreignTable, foreignKey);
    _references.add(ref);
    return ref;
  }
}

class MigrationColumnReference {
  final String foreignTable, foreignKey;
  String _behavior;

  MigrationColumnReference._(this.foreignTable, this.foreignKey);

  String get behavior => _behavior;

  StateError _locked() => new StateError(
      'Cannot override existing "$_behavior" behavior.');

  void onDeleteCascade() {
    if (_behavior != null) throw _locked();
    _behavior = 'ON DELETE CASCADE';
  }

  void onUpdateCascade() {
    if (_behavior != null) throw _locked();
    _behavior = 'ON UPDATE CASCADE';
  }

  void onNoAction() {
    if (_behavior != null) throw _locked();
    _behavior = 'ON UPDATE NO ACTION';
  }

  void onUpdateSetDefault() {
    if (_behavior != null) throw _locked();
    _behavior = 'ON UPDATE SET DEFAULT';
  }

  void onUpdateSetNull() {
    if (_behavior != null) throw _locked();
    _behavior = 'ON UPDATE SET NULL';
  }
}
