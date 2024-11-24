// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmes_by_category_get.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$refCustomerFarmersByCategoryGetHash() =>
    r'84d089216c0fd3a6ff186d0136690ac1646dbbc8';

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

abstract class _$RefCustomerFarmersByCategoryGet
    extends BuildlessAutoDisposeAsyncNotifier<List<FarmerModel>> {
  late final String category;

  FutureOr<List<FarmerModel>> build(
    String category,
  );
}

/// See also [RefCustomerFarmersByCategoryGet].
@ProviderFor(RefCustomerFarmersByCategoryGet)
const refCustomerFarmersByCategoryGetProvider =
    RefCustomerFarmersByCategoryGetFamily();

/// See also [RefCustomerFarmersByCategoryGet].
class RefCustomerFarmersByCategoryGetFamily
    extends Family<AsyncValue<List<FarmerModel>>> {
  /// See also [RefCustomerFarmersByCategoryGet].
  const RefCustomerFarmersByCategoryGetFamily();

  /// See also [RefCustomerFarmersByCategoryGet].
  RefCustomerFarmersByCategoryGetProvider call(
    String category,
  ) {
    return RefCustomerFarmersByCategoryGetProvider(
      category,
    );
  }

  @override
  RefCustomerFarmersByCategoryGetProvider getProviderOverride(
    covariant RefCustomerFarmersByCategoryGetProvider provider,
  ) {
    return call(
      provider.category,
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
  String? get name => r'refCustomerFarmersByCategoryGetProvider';
}

/// See also [RefCustomerFarmersByCategoryGet].
class RefCustomerFarmersByCategoryGetProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        RefCustomerFarmersByCategoryGet, List<FarmerModel>> {
  /// See also [RefCustomerFarmersByCategoryGet].
  RefCustomerFarmersByCategoryGetProvider(
    String category,
  ) : this._internal(
          () => RefCustomerFarmersByCategoryGet()..category = category,
          from: refCustomerFarmersByCategoryGetProvider,
          name: r'refCustomerFarmersByCategoryGetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$refCustomerFarmersByCategoryGetHash,
          dependencies: RefCustomerFarmersByCategoryGetFamily._dependencies,
          allTransitiveDependencies:
              RefCustomerFarmersByCategoryGetFamily._allTransitiveDependencies,
          category: category,
        );

  RefCustomerFarmersByCategoryGetProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final String category;

  @override
  FutureOr<List<FarmerModel>> runNotifierBuild(
    covariant RefCustomerFarmersByCategoryGet notifier,
  ) {
    return notifier.build(
      category,
    );
  }

  @override
  Override overrideWith(RefCustomerFarmersByCategoryGet Function() create) {
    return ProviderOverride(
      origin: this,
      override: RefCustomerFarmersByCategoryGetProvider._internal(
        () => create()..category = category,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RefCustomerFarmersByCategoryGet,
      List<FarmerModel>> createElement() {
    return _RefCustomerFarmersByCategoryGetProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RefCustomerFarmersByCategoryGetProvider &&
        other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RefCustomerFarmersByCategoryGetRef
    on AutoDisposeAsyncNotifierProviderRef<List<FarmerModel>> {
  /// The parameter `category` of this provider.
  String get category;
}

class _RefCustomerFarmersByCategoryGetProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        RefCustomerFarmersByCategoryGet,
        List<FarmerModel>> with RefCustomerFarmersByCategoryGetRef {
  _RefCustomerFarmersByCategoryGetProviderElement(super.provider);

  @override
  String get category =>
      (origin as RefCustomerFarmersByCategoryGetProvider).category;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
