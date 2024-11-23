// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_get.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$refCustomerOfferGetHash() =>
    r'246633abb29be5553ac5ce249b59d013c6d34449';

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

abstract class _$RefCustomerOfferGet
    extends BuildlessAutoDisposeAsyncNotifier<OfferModel?> {
  late final String offerId;

  FutureOr<OfferModel?> build(
    String offerId,
  );
}

/// See also [RefCustomerOfferGet].
@ProviderFor(RefCustomerOfferGet)
const refCustomerOfferGetProvider = RefCustomerOfferGetFamily();

/// See also [RefCustomerOfferGet].
class RefCustomerOfferGetFamily extends Family<AsyncValue<OfferModel?>> {
  /// See also [RefCustomerOfferGet].
  const RefCustomerOfferGetFamily();

  /// See also [RefCustomerOfferGet].
  RefCustomerOfferGetProvider call(
    String offerId,
  ) {
    return RefCustomerOfferGetProvider(
      offerId,
    );
  }

  @override
  RefCustomerOfferGetProvider getProviderOverride(
    covariant RefCustomerOfferGetProvider provider,
  ) {
    return call(
      provider.offerId,
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
  String? get name => r'refCustomerOfferGetProvider';
}

/// See also [RefCustomerOfferGet].
class RefCustomerOfferGetProvider extends AutoDisposeAsyncNotifierProviderImpl<
    RefCustomerOfferGet, OfferModel?> {
  /// See also [RefCustomerOfferGet].
  RefCustomerOfferGetProvider(
    String offerId,
  ) : this._internal(
          () => RefCustomerOfferGet()..offerId = offerId,
          from: refCustomerOfferGetProvider,
          name: r'refCustomerOfferGetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$refCustomerOfferGetHash,
          dependencies: RefCustomerOfferGetFamily._dependencies,
          allTransitiveDependencies:
              RefCustomerOfferGetFamily._allTransitiveDependencies,
          offerId: offerId,
        );

  RefCustomerOfferGetProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.offerId,
  }) : super.internal();

  final String offerId;

  @override
  FutureOr<OfferModel?> runNotifierBuild(
    covariant RefCustomerOfferGet notifier,
  ) {
    return notifier.build(
      offerId,
    );
  }

  @override
  Override overrideWith(RefCustomerOfferGet Function() create) {
    return ProviderOverride(
      origin: this,
      override: RefCustomerOfferGetProvider._internal(
        () => create()..offerId = offerId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        offerId: offerId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RefCustomerOfferGet, OfferModel?>
      createElement() {
    return _RefCustomerOfferGetProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RefCustomerOfferGetProvider && other.offerId == offerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, offerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RefCustomerOfferGetRef
    on AutoDisposeAsyncNotifierProviderRef<OfferModel?> {
  /// The parameter `offerId` of this provider.
  String get offerId;
}

class _RefCustomerOfferGetProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RefCustomerOfferGet,
        OfferModel?> with RefCustomerOfferGetRef {
  _RefCustomerOfferGetProviderElement(super.provider);

  @override
  String get offerId => (origin as RefCustomerOfferGetProvider).offerId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
