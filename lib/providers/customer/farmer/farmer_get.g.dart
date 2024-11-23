// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmer_get.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$refCustomerFarmerGetHash() =>
    r'102b0a5a4396bc97b52c19c08f5373d1f8d9549c';

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

abstract class _$RefCustomerFarmerGet
    extends BuildlessAutoDisposeAsyncNotifier<FarmerModel?> {
  late final String farmerId;

  FutureOr<FarmerModel?> build(
    String farmerId,
  );
}

/// See also [RefCustomerFarmerGet].
@ProviderFor(RefCustomerFarmerGet)
const refCustomerFarmerGetProvider = RefCustomerFarmerGetFamily();

/// See also [RefCustomerFarmerGet].
class RefCustomerFarmerGetFamily extends Family<AsyncValue<FarmerModel?>> {
  /// See also [RefCustomerFarmerGet].
  const RefCustomerFarmerGetFamily();

  /// See also [RefCustomerFarmerGet].
  RefCustomerFarmerGetProvider call(
    String farmerId,
  ) {
    return RefCustomerFarmerGetProvider(
      farmerId,
    );
  }

  @override
  RefCustomerFarmerGetProvider getProviderOverride(
    covariant RefCustomerFarmerGetProvider provider,
  ) {
    return call(
      provider.farmerId,
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
  String? get name => r'refCustomerFarmerGetProvider';
}

/// See also [RefCustomerFarmerGet].
class RefCustomerFarmerGetProvider extends AutoDisposeAsyncNotifierProviderImpl<
    RefCustomerFarmerGet, FarmerModel?> {
  /// See also [RefCustomerFarmerGet].
  RefCustomerFarmerGetProvider(
    String farmerId,
  ) : this._internal(
          () => RefCustomerFarmerGet()..farmerId = farmerId,
          from: refCustomerFarmerGetProvider,
          name: r'refCustomerFarmerGetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$refCustomerFarmerGetHash,
          dependencies: RefCustomerFarmerGetFamily._dependencies,
          allTransitiveDependencies:
              RefCustomerFarmerGetFamily._allTransitiveDependencies,
          farmerId: farmerId,
        );

  RefCustomerFarmerGetProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.farmerId,
  }) : super.internal();

  final String farmerId;

  @override
  FutureOr<FarmerModel?> runNotifierBuild(
    covariant RefCustomerFarmerGet notifier,
  ) {
    return notifier.build(
      farmerId,
    );
  }

  @override
  Override overrideWith(RefCustomerFarmerGet Function() create) {
    return ProviderOverride(
      origin: this,
      override: RefCustomerFarmerGetProvider._internal(
        () => create()..farmerId = farmerId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        farmerId: farmerId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RefCustomerFarmerGet, FarmerModel?>
      createElement() {
    return _RefCustomerFarmerGetProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RefCustomerFarmerGetProvider && other.farmerId == farmerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, farmerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RefCustomerFarmerGetRef
    on AutoDisposeAsyncNotifierProviderRef<FarmerModel?> {
  /// The parameter `farmerId` of this provider.
  String get farmerId;
}

class _RefCustomerFarmerGetProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RefCustomerFarmerGet,
        FarmerModel?> with RefCustomerFarmerGetRef {
  _RefCustomerFarmerGetProviderElement(super.provider);

  @override
  String get farmerId => (origin as RefCustomerFarmerGetProvider).farmerId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
