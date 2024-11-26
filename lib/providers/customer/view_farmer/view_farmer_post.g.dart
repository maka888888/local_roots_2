// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_farmer_post.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$refCustomerFarmerViewPostHash() =>
    r'812a57375ef37c824a360326131dfb14a48ed59f';

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

abstract class _$RefCustomerFarmerViewPost
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String farmerAppUserId;

  FutureOr<void> build(
    String farmerAppUserId,
  );
}

/// See also [RefCustomerFarmerViewPost].
@ProviderFor(RefCustomerFarmerViewPost)
const refCustomerFarmerViewPostProvider = RefCustomerFarmerViewPostFamily();

/// See also [RefCustomerFarmerViewPost].
class RefCustomerFarmerViewPostFamily extends Family<AsyncValue<void>> {
  /// See also [RefCustomerFarmerViewPost].
  const RefCustomerFarmerViewPostFamily();

  /// See also [RefCustomerFarmerViewPost].
  RefCustomerFarmerViewPostProvider call(
    String farmerAppUserId,
  ) {
    return RefCustomerFarmerViewPostProvider(
      farmerAppUserId,
    );
  }

  @override
  RefCustomerFarmerViewPostProvider getProviderOverride(
    covariant RefCustomerFarmerViewPostProvider provider,
  ) {
    return call(
      provider.farmerAppUserId,
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
  String? get name => r'refCustomerFarmerViewPostProvider';
}

/// See also [RefCustomerFarmerViewPost].
class RefCustomerFarmerViewPostProvider
    extends AutoDisposeAsyncNotifierProviderImpl<RefCustomerFarmerViewPost,
        void> {
  /// See also [RefCustomerFarmerViewPost].
  RefCustomerFarmerViewPostProvider(
    String farmerAppUserId,
  ) : this._internal(
          () => RefCustomerFarmerViewPost()..farmerAppUserId = farmerAppUserId,
          from: refCustomerFarmerViewPostProvider,
          name: r'refCustomerFarmerViewPostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$refCustomerFarmerViewPostHash,
          dependencies: RefCustomerFarmerViewPostFamily._dependencies,
          allTransitiveDependencies:
              RefCustomerFarmerViewPostFamily._allTransitiveDependencies,
          farmerAppUserId: farmerAppUserId,
        );

  RefCustomerFarmerViewPostProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.farmerAppUserId,
  }) : super.internal();

  final String farmerAppUserId;

  @override
  FutureOr<void> runNotifierBuild(
    covariant RefCustomerFarmerViewPost notifier,
  ) {
    return notifier.build(
      farmerAppUserId,
    );
  }

  @override
  Override overrideWith(RefCustomerFarmerViewPost Function() create) {
    return ProviderOverride(
      origin: this,
      override: RefCustomerFarmerViewPostProvider._internal(
        () => create()..farmerAppUserId = farmerAppUserId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        farmerAppUserId: farmerAppUserId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RefCustomerFarmerViewPost, void>
      createElement() {
    return _RefCustomerFarmerViewPostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RefCustomerFarmerViewPostProvider &&
        other.farmerAppUserId == farmerAppUserId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, farmerAppUserId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RefCustomerFarmerViewPostRef
    on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `farmerAppUserId` of this provider.
  String get farmerAppUserId;
}

class _RefCustomerFarmerViewPostProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RefCustomerFarmerViewPost,
        void> with RefCustomerFarmerViewPostRef {
  _RefCustomerFarmerViewPostProviderElement(super.provider);

  @override
  String get farmerAppUserId =>
      (origin as RefCustomerFarmerViewPostProvider).farmerAppUserId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
