// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_get.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$refFarmerCandidateGetHash() =>
    r'bb0ab5b220d6f6c5f49789d42d4e81d2e7bd8268';

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

abstract class _$RefFarmerCandidateGet
    extends BuildlessAutoDisposeAsyncNotifier<FarmerCandidateModel?> {
  late final String email;

  FutureOr<FarmerCandidateModel?> build(
    String email,
  );
}

/// See also [RefFarmerCandidateGet].
@ProviderFor(RefFarmerCandidateGet)
const refFarmerCandidateGetProvider = RefFarmerCandidateGetFamily();

/// See also [RefFarmerCandidateGet].
class RefFarmerCandidateGetFamily
    extends Family<AsyncValue<FarmerCandidateModel?>> {
  /// See also [RefFarmerCandidateGet].
  const RefFarmerCandidateGetFamily();

  /// See also [RefFarmerCandidateGet].
  RefFarmerCandidateGetProvider call(
    String email,
  ) {
    return RefFarmerCandidateGetProvider(
      email,
    );
  }

  @override
  RefFarmerCandidateGetProvider getProviderOverride(
    covariant RefFarmerCandidateGetProvider provider,
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
  String? get name => r'refFarmerCandidateGetProvider';
}

/// See also [RefFarmerCandidateGet].
class RefFarmerCandidateGetProvider
    extends AutoDisposeAsyncNotifierProviderImpl<RefFarmerCandidateGet,
        FarmerCandidateModel?> {
  /// See also [RefFarmerCandidateGet].
  RefFarmerCandidateGetProvider(
    String email,
  ) : this._internal(
          () => RefFarmerCandidateGet()..email = email,
          from: refFarmerCandidateGetProvider,
          name: r'refFarmerCandidateGetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$refFarmerCandidateGetHash,
          dependencies: RefFarmerCandidateGetFamily._dependencies,
          allTransitiveDependencies:
              RefFarmerCandidateGetFamily._allTransitiveDependencies,
          email: email,
        );

  RefFarmerCandidateGetProvider._internal(
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
    covariant RefFarmerCandidateGet notifier,
  ) {
    return notifier.build(
      email,
    );
  }

  @override
  Override overrideWith(RefFarmerCandidateGet Function() create) {
    return ProviderOverride(
      origin: this,
      override: RefFarmerCandidateGetProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<RefFarmerCandidateGet,
      FarmerCandidateModel?> createElement() {
    return _RefFarmerCandidateGetProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RefFarmerCandidateGetProvider && other.email == email;
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
mixin RefFarmerCandidateGetRef
    on AutoDisposeAsyncNotifierProviderRef<FarmerCandidateModel?> {
  /// The parameter `email` of this provider.
  String get email;
}

class _RefFarmerCandidateGetProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RefFarmerCandidateGet,
        FarmerCandidateModel?> with RefFarmerCandidateGetRef {
  _RefFarmerCandidateGetProviderElement(super.provider);

  @override
  String get email => (origin as RefFarmerCandidateGetProvider).email;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
