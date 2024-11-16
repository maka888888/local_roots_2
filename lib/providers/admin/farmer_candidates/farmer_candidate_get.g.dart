// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmer_candidate_get.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$refAdminFarmerCandidateGetHash() =>
    r'7b03fae9f6fe8720460d93417ed614ae722b946a';

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

abstract class _$RefAdminFarmerCandidateGet
    extends BuildlessAutoDisposeAsyncNotifier<FarmerCandidateModel?> {
  late final String email;

  FutureOr<FarmerCandidateModel?> build(
    String email,
  );
}

/// See also [RefAdminFarmerCandidateGet].
@ProviderFor(RefAdminFarmerCandidateGet)
const refAdminFarmerCandidateGetProvider = RefAdminFarmerCandidateGetFamily();

/// See also [RefAdminFarmerCandidateGet].
class RefAdminFarmerCandidateGetFamily
    extends Family<AsyncValue<FarmerCandidateModel?>> {
  /// See also [RefAdminFarmerCandidateGet].
  const RefAdminFarmerCandidateGetFamily();

  /// See also [RefAdminFarmerCandidateGet].
  RefAdminFarmerCandidateGetProvider call(
    String email,
  ) {
    return RefAdminFarmerCandidateGetProvider(
      email,
    );
  }

  @override
  RefAdminFarmerCandidateGetProvider getProviderOverride(
    covariant RefAdminFarmerCandidateGetProvider provider,
  ) {
    return call(
      provider.email,
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
  String? get name => r'refAdminFarmerCandidateGetProvider';
}

/// See also [RefAdminFarmerCandidateGet].
class RefAdminFarmerCandidateGetProvider
    extends AutoDisposeAsyncNotifierProviderImpl<RefAdminFarmerCandidateGet,
        FarmerCandidateModel?> {
  /// See also [RefAdminFarmerCandidateGet].
  RefAdminFarmerCandidateGetProvider(
    String email,
  ) : this._internal(
          () => RefAdminFarmerCandidateGet()..email = email,
          from: refAdminFarmerCandidateGetProvider,
          name: r'refAdminFarmerCandidateGetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$refAdminFarmerCandidateGetHash,
          dependencies: RefAdminFarmerCandidateGetFamily._dependencies,
          allTransitiveDependencies:
              RefAdminFarmerCandidateGetFamily._allTransitiveDependencies,
          email: email,
        );

  RefAdminFarmerCandidateGetProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
  }) : super.internal();

  final String email;

  @override
  FutureOr<FarmerCandidateModel?> runNotifierBuild(
    covariant RefAdminFarmerCandidateGet notifier,
  ) {
    return notifier.build(
      email,
    );
  }

  @override
  Override overrideWith(RefAdminFarmerCandidateGet Function() create) {
    return ProviderOverride(
      origin: this,
      override: RefAdminFarmerCandidateGetProvider._internal(
        () => create()..email = email,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RefAdminFarmerCandidateGet,
      FarmerCandidateModel?> createElement() {
    return _RefAdminFarmerCandidateGetProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RefAdminFarmerCandidateGetProvider && other.email == email;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RefAdminFarmerCandidateGetRef
    on AutoDisposeAsyncNotifierProviderRef<FarmerCandidateModel?> {
  /// The parameter `email` of this provider.
  String get email;
}

class _RefAdminFarmerCandidateGetProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RefAdminFarmerCandidateGet,
        FarmerCandidateModel?> with RefAdminFarmerCandidateGetRef {
  _RefAdminFarmerCandidateGetProviderElement(super.provider);

  @override
  String get email => (origin as RefAdminFarmerCandidateGetProvider).email;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
