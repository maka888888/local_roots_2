// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_offer_post.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$refCustomerOfferViewPostHash() =>
    r'6512c79b78a969f682637d0e7a394f011fc9b333';

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

abstract class _$RefCustomerOfferViewPost
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String offerId;

  FutureOr<void> build(
    String offerId,
  );
}

/// See also [RefCustomerOfferViewPost].
@ProviderFor(RefCustomerOfferViewPost)
const refCustomerOfferViewPostProvider = RefCustomerOfferViewPostFamily();

/// See also [RefCustomerOfferViewPost].
class RefCustomerOfferViewPostFamily extends Family<AsyncValue<void>> {
  /// See also [RefCustomerOfferViewPost].
  const RefCustomerOfferViewPostFamily();

  /// See also [RefCustomerOfferViewPost].
  RefCustomerOfferViewPostProvider call(
    String offerId,
  ) {
    return RefCustomerOfferViewPostProvider(
      offerId,
    );
  }

  @override
  RefCustomerOfferViewPostProvider getProviderOverride(
    covariant RefCustomerOfferViewPostProvider provider,
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
  String? get name => r'refCustomerOfferViewPostProvider';
}

/// See also [RefCustomerOfferViewPost].
class RefCustomerOfferViewPostProvider
    extends AutoDisposeAsyncNotifierProviderImpl<RefCustomerOfferViewPost,
        void> {
  /// See also [RefCustomerOfferViewPost].
  RefCustomerOfferViewPostProvider(
    String offerId,
  ) : this._internal(
          () => RefCustomerOfferViewPost()..offerId = offerId,
          from: refCustomerOfferViewPostProvider,
          name: r'refCustomerOfferViewPostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$refCustomerOfferViewPostHash,
          dependencies: RefCustomerOfferViewPostFamily._dependencies,
          allTransitiveDependencies:
              RefCustomerOfferViewPostFamily._allTransitiveDependencies,
          offerId: offerId,
        );

  RefCustomerOfferViewPostProvider._internal(
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
  FutureOr<void> runNotifierBuild(
    covariant RefCustomerOfferViewPost notifier,
  ) {
    return notifier.build(
      offerId,
    );
  }

  @override
  Override overrideWith(RefCustomerOfferViewPost Function() create) {
    return ProviderOverride(
      origin: this,
      override: RefCustomerOfferViewPostProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<RefCustomerOfferViewPost, void>
      createElement() {
    return _RefCustomerOfferViewPostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RefCustomerOfferViewPostProvider &&
        other.offerId == offerId;
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
mixin RefCustomerOfferViewPostRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `offerId` of this provider.
  String get offerId;
}

class _RefCustomerOfferViewPostProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RefCustomerOfferViewPost,
        void> with RefCustomerOfferViewPostRef {
  _RefCustomerOfferViewPostProviderElement(super.provider);

  @override
  String get offerId => (origin as RefCustomerOfferViewPostProvider).offerId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
