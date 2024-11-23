// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_location_stream.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$refFarmerSalesLocationStreamHash() =>
    r'40f3660918e45507cefc3975b4e89ab99cef78b3';

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

abstract class _$RefFarmerSalesLocationStream
    extends BuildlessAutoDisposeStreamNotifier<SalesLocationModel?> {
  late final String locationId;

  Stream<SalesLocationModel?> build(
    String locationId,
  );
}

/// See also [RefFarmerSalesLocationStream].
@ProviderFor(RefFarmerSalesLocationStream)
const refFarmerSalesLocationStreamProvider =
    RefFarmerSalesLocationStreamFamily();

/// See also [RefFarmerSalesLocationStream].
class RefFarmerSalesLocationStreamFamily
    extends Family<AsyncValue<SalesLocationModel?>> {
  /// See also [RefFarmerSalesLocationStream].
  const RefFarmerSalesLocationStreamFamily();

  /// See also [RefFarmerSalesLocationStream].
  RefFarmerSalesLocationStreamProvider call(
    String locationId,
  ) {
    return RefFarmerSalesLocationStreamProvider(
      locationId,
    );
  }

  @override
  RefFarmerSalesLocationStreamProvider getProviderOverride(
    covariant RefFarmerSalesLocationStreamProvider provider,
  ) {
    return call(
      provider.locationId,
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
  String? get name => r'refFarmerSalesLocationStreamProvider';
}

/// See also [RefFarmerSalesLocationStream].
class RefFarmerSalesLocationStreamProvider
    extends AutoDisposeStreamNotifierProviderImpl<RefFarmerSalesLocationStream,
        SalesLocationModel?> {
  /// See also [RefFarmerSalesLocationStream].
  RefFarmerSalesLocationStreamProvider(
    String locationId,
  ) : this._internal(
          () => RefFarmerSalesLocationStream()..locationId = locationId,
          from: refFarmerSalesLocationStreamProvider,
          name: r'refFarmerSalesLocationStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$refFarmerSalesLocationStreamHash,
          dependencies: RefFarmerSalesLocationStreamFamily._dependencies,
          allTransitiveDependencies:
              RefFarmerSalesLocationStreamFamily._allTransitiveDependencies,
          locationId: locationId,
        );

  RefFarmerSalesLocationStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.locationId,
  }) : super.internal();

  final String locationId;

  @override
  Stream<SalesLocationModel?> runNotifierBuild(
    covariant RefFarmerSalesLocationStream notifier,
  ) {
    return notifier.build(
      locationId,
    );
  }

  @override
  Override overrideWith(RefFarmerSalesLocationStream Function() create) {
    return ProviderOverride(
      origin: this,
      override: RefFarmerSalesLocationStreamProvider._internal(
        () => create()..locationId = locationId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        locationId: locationId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<RefFarmerSalesLocationStream,
      SalesLocationModel?> createElement() {
    return _RefFarmerSalesLocationStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RefFarmerSalesLocationStreamProvider &&
        other.locationId == locationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, locationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RefFarmerSalesLocationStreamRef
    on AutoDisposeStreamNotifierProviderRef<SalesLocationModel?> {
  /// The parameter `locationId` of this provider.
  String get locationId;
}

class _RefFarmerSalesLocationStreamProviderElement
    extends AutoDisposeStreamNotifierProviderElement<
        RefFarmerSalesLocationStream,
        SalesLocationModel?> with RefFarmerSalesLocationStreamRef {
  _RefFarmerSalesLocationStreamProviderElement(super.provider);

  @override
  String get locationId =>
      (origin as RefFarmerSalesLocationStreamProvider).locationId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
