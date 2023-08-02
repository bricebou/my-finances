// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$budgetControllerHash() => r'0b1cb4911eaa41297891dcdfe6cff2c552a27258';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$BudgetController
    extends BuildlessAutoDisposeAsyncNotifier<Budget> {
  late final String? id;

  Future<Budget> build(
    String? id,
  );
}

/// See also [BudgetController].
@ProviderFor(BudgetController)
const budgetControllerProvider = BudgetControllerFamily();

/// See also [BudgetController].
class BudgetControllerFamily extends Family<AsyncValue<Budget>> {
  /// See also [BudgetController].
  const BudgetControllerFamily();

  /// See also [BudgetController].
  BudgetControllerProvider call(
    String? id,
  ) {
    return BudgetControllerProvider(
      id,
    );
  }

  @override
  BudgetControllerProvider getProviderOverride(
    covariant BudgetControllerProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'budgetControllerProvider';
}

/// See also [BudgetController].
class BudgetControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<BudgetController, Budget> {
  /// See also [BudgetController].
  BudgetControllerProvider(
    this.id,
  ) : super.internal(
          () => BudgetController()..id = id,
          from: budgetControllerProvider,
          name: r'budgetControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$budgetControllerHash,
          dependencies: BudgetControllerFamily._dependencies,
          allTransitiveDependencies:
              BudgetControllerFamily._allTransitiveDependencies,
        );

  final String? id;

  @override
  bool operator ==(Object other) {
    return other is BudgetControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<Budget> runNotifierBuild(
    covariant BudgetController notifier,
  ) {
    return notifier.build(
      id,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
