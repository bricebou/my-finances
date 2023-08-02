// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Budget _$BudgetFromJson(Map<String, dynamic> json) {
  return _Budget.fromJson(json);
}

/// @nodoc
mixin _$Budget {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  DateTime get endDate => throw _privateConstructorUsedError;
  List<Income> get incomes => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_incomes')
  double get totalIncomes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BudgetCopyWith<Budget> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetCopyWith<$Res> {
  factory $BudgetCopyWith(Budget value, $Res Function(Budget) then) =
      _$BudgetCopyWithImpl<$Res, Budget>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'start_date') DateTime startDate,
      @JsonKey(name: 'end_date') DateTime endDate,
      List<Income> incomes,
      @JsonKey(name: 'total_incomes') double totalIncomes});
}

/// @nodoc
class _$BudgetCopyWithImpl<$Res, $Val extends Budget>
    implements $BudgetCopyWith<$Res> {
  _$BudgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? incomes = null,
    Object? totalIncomes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      incomes: null == incomes
          ? _value.incomes
          : incomes // ignore: cast_nullable_to_non_nullable
              as List<Income>,
      totalIncomes: null == totalIncomes
          ? _value.totalIncomes
          : totalIncomes // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BudgetCopyWith<$Res> implements $BudgetCopyWith<$Res> {
  factory _$$_BudgetCopyWith(_$_Budget value, $Res Function(_$_Budget) then) =
      __$$_BudgetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'start_date') DateTime startDate,
      @JsonKey(name: 'end_date') DateTime endDate,
      List<Income> incomes,
      @JsonKey(name: 'total_incomes') double totalIncomes});
}

/// @nodoc
class __$$_BudgetCopyWithImpl<$Res>
    extends _$BudgetCopyWithImpl<$Res, _$_Budget>
    implements _$$_BudgetCopyWith<$Res> {
  __$$_BudgetCopyWithImpl(_$_Budget _value, $Res Function(_$_Budget) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? incomes = null,
    Object? totalIncomes = null,
  }) {
    return _then(_$_Budget(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      incomes: null == incomes
          ? _value._incomes
          : incomes // ignore: cast_nullable_to_non_nullable
              as List<Income>,
      totalIncomes: null == totalIncomes
          ? _value.totalIncomes
          : totalIncomes // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Budget implements _Budget {
  const _$_Budget(
      {required this.id,
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') required this.endDate,
      final List<Income> incomes = const [],
      @JsonKey(name: 'total_incomes') required this.totalIncomes})
      : _incomes = incomes;

  factory _$_Budget.fromJson(Map<String, dynamic> json) =>
      _$$_BudgetFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  @override
  @JsonKey(name: 'end_date')
  final DateTime endDate;
  final List<Income> _incomes;
  @override
  @JsonKey()
  List<Income> get incomes {
    if (_incomes is EqualUnmodifiableListView) return _incomes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incomes);
  }

  @override
  @JsonKey(name: 'total_incomes')
  final double totalIncomes;

  @override
  String toString() {
    return 'Budget(id: $id, startDate: $startDate, endDate: $endDate, incomes: $incomes, totalIncomes: $totalIncomes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Budget &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(other._incomes, _incomes) &&
            (identical(other.totalIncomes, totalIncomes) ||
                other.totalIncomes == totalIncomes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, startDate, endDate,
      const DeepCollectionEquality().hash(_incomes), totalIncomes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BudgetCopyWith<_$_Budget> get copyWith =>
      __$$_BudgetCopyWithImpl<_$_Budget>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BudgetToJson(
      this,
    );
  }
}

abstract class _Budget implements Budget {
  const factory _Budget(
          {required final String id,
          @JsonKey(name: 'start_date') required final DateTime startDate,
          @JsonKey(name: 'end_date') required final DateTime endDate,
          final List<Income> incomes,
          @JsonKey(name: 'total_incomes') required final double totalIncomes}) =
      _$_Budget;

  factory _Budget.fromJson(Map<String, dynamic> json) = _$_Budget.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'start_date')
  DateTime get startDate;
  @override
  @JsonKey(name: 'end_date')
  DateTime get endDate;
  @override
  List<Income> get incomes;
  @override
  @JsonKey(name: 'total_incomes')
  double get totalIncomes;
  @override
  @JsonKey(ignore: true)
  _$$_BudgetCopyWith<_$_Budget> get copyWith =>
      throw _privateConstructorUsedError;
}
