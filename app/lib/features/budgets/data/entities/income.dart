import 'package:freezed_annotation/freezed_annotation.dart';

part 'income.freezed.dart';
part 'income.g.dart';

@freezed
class Income with _$Income {
  const factory Income({
    required String id,
    required String title,
    required String description,
    required double amount,
    @JsonKey(name: 'transaction_date') required DateTime transactionDate,
  }) = _Income;

  factory Income.fromJson(Map<String, dynamic> json) => _$IncomeFromJson(json);
}
