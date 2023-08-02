// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Budget _$$_BudgetFromJson(Map<String, dynamic> json) => _$_Budget(
      id: json['id'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      incomes: (json['incomes'] as List<dynamic>?)
              ?.map((e) => Income.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalIncomes: (json['total_incomes'] as num).toDouble(),
    );

Map<String, dynamic> _$$_BudgetToJson(_$_Budget instance) => <String, dynamic>{
      'id': instance.id,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'incomes': instance.incomes,
      'total_incomes': instance.totalIncomes,
    };
