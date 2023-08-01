import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget.freezed.dart';

@freezed
class Budget with _$Budget {
  const factory Budget({
    required String id,
  }) = _Budget;
}
