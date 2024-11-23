// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_farmer_stream.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$refCustomerOffersFarmerStreamHash() =>
    r'372f61e5f714234de4a80a7b5597c0d12cba6815';

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

abstract class _$RefCustomerOffersFarmerStream
    extends BuildlessAutoDisposeStreamNotifier<List<OfferModel>> {
  late final String appUserId;

  Stream<List<OfferModel>> build(
    String appUserId,
  );
}

/// See also [RefCustomerOffersFarmerStream].
@ProviderFor(RefCustomerOffersFarmerStream)
const refCustomerOffersFarmerStreamProvider =
    RefCustomerOffersFarmerStreamFamily();

/// See also [RefCustomerOffersFarmerStream].
class RefCustomerOffersFarmerStreamFamily
    extends Family<AsyncValue<List<OfferModel>>> {
  /// See also [RefCustomerOffersFarmerStream].
  const RefCustomerOffersFarmerStreamFamily();

  /// See also [RefCustomerOffersFarmerStream].
  RefCustomerOffersFarmerStreamProvider call(
    String appUserId,
  ) {
    return RefCustomerOffersFarmerStreamProvider(
      appUserId,
    );
  }

  @override
  RefCustomerOffersFarmerStreamProvider getProviderOverride(
    covariant RefCustomerOffersFarmerStreamProvider provider,
  ) {
    return call(
      provider.appUserId,
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
  String? get name => r'refCustomerOffersFarmerStreamProvider';
}

/// See also [RefCustomerOffersFarmerStream].
class RefCustomerOffersFarmerStreamProvider
    extends AutoDisposeStreamNotifierProviderImpl<RefCustomerOffersFarmerStream,
        List<OfferModel>> {
  /// See also [RefCustomerOffersFarmerStream].
  RefCustomerOffersFarmerStreamProvider(
    String appUserId,
  ) : this._internal(
          () => RefCustomerOffersFarmerStream()..appUserId = appUserId,
          from: refCustomerOffersFarmerStreamProvider,
          name: r'refCustomerOffersFarmerStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$refCustomerOffersFarmerStreamHash,
          dependencies: RefCustomerOffersFarmerStreamFamily._dependencies,
          allTransitiveDependencies:
              RefCustomerOffersFarmerStreamFamily._allTransitiveDependencies,
          appUserId: appUserId,
        );

  RefCustomerOffersFarmerStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.appUserId,
  }) : super.internal();

  final String appUserId;

  @override
  Stream<List<OfferModel>> runNotifierBuild(
    covariant RefCustomerOffersFarmerStream notifier,
  ) {
    return notifier.build(
      appUserId,
    );
  }

  @override
  Override overrideWith(RefCustomerOffersFarmerStream Function() create) {
    return ProviderOverride(
      origin: this,
      override: RefCustomerOffersFarmerStreamProvider._internal(
        () => create()..appUserId = appUserId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        appUserId: appUserId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<RefCustomerOffersFarmerStream,
      List<OfferModel>> createElement() {
    return _RefCustomerOffersFarmerStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RefCustomerOffersFarmerStreamProvider &&
        other.appUserId == appUserId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, appUserId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RefCustomerOffersFarmerStreamRef
    on AutoDisposeStreamNotifierProviderRef<List<OfferModel>> {
  /// The parameter `appUserId` of this provider.
  String get appUserId;
}

class _RefCustomerOffersFarmerStreamProviderElement
    extends AutoDisposeStreamNotifierProviderElement<
        RefCustomerOffersFarmerStream,
        List<OfferModel>> with RefCustomerOffersFarmerStreamRef {
  _RefCustomerOffersFarmerStreamProviderElement(super.provider);

  @override
  String get appUserId =>
      (origin as RefCustomerOffersFarmerStreamProvider).appUserId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
