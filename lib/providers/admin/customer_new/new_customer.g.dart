// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_customer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$refAdminCustomerNewHash() =>
    r'edfd04ac04fab79af8031d4391c3d99cb7a0fba4';

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

abstract class _$RefAdminCustomerNew
    extends BuildlessAutoDisposeNotifier<CustomerModel> {
  late final AppUserModel appUser;

  CustomerModel build(
    AppUserModel appUser,
  );
}

/// See also [RefAdminCustomerNew].
@ProviderFor(RefAdminCustomerNew)
const refAdminCustomerNewProvider = RefAdminCustomerNewFamily();

/// See also [RefAdminCustomerNew].
class RefAdminCustomerNewFamily extends Family<CustomerModel> {
  /// See also [RefAdminCustomerNew].
  const RefAdminCustomerNewFamily();

  /// See also [RefAdminCustomerNew].
  RefAdminCustomerNewProvider call(
    AppUserModel appUser,
  ) {
    return RefAdminCustomerNewProvider(
      appUser,
    );
  }

  @override
  RefAdminCustomerNewProvider getProviderOverride(
    covariant RefAdminCustomerNewProvider provider,
  ) {
    return call(
      provider.appUser,
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
  String? get name => r'refAdminCustomerNewProvider';
}

/// See also [RefAdminCustomerNew].
class RefAdminCustomerNewProvider extends AutoDisposeNotifierProviderImpl<
    RefAdminCustomerNew, CustomerModel> {
  /// See also [RefAdminCustomerNew].
  RefAdminCustomerNewProvider(
    AppUserModel appUser,
  ) : this._internal(
          () => RefAdminCustomerNew()..appUser = appUser,
          from: refAdminCustomerNewProvider,
          name: r'refAdminCustomerNewProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$refAdminCustomerNewHash,
          dependencies: RefAdminCustomerNewFamily._dependencies,
          allTransitiveDependencies:
              RefAdminCustomerNewFamily._allTransitiveDependencies,
          appUser: appUser,
        );

  RefAdminCustomerNewProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.appUser,
  }) : super.internal();

  final AppUserModel appUser;

  @override
  CustomerModel runNotifierBuild(
    covariant RefAdminCustomerNew notifier,
  ) {
    return notifier.build(
      appUser,
    );
  }

  @override
  Override overrideWith(RefAdminCustomerNew Function() create) {
    return ProviderOverride(
      origin: this,
      override: RefAdminCustomerNewProvider._internal(
        () => create()..appUser = appUser,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        appUser: appUser,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<RefAdminCustomerNew, CustomerModel>
      createElement() {
    return _RefAdminCustomerNewProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RefAdminCustomerNewProvider && other.appUser == appUser;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, appUser.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RefAdminCustomerNewRef on AutoDisposeNotifierProviderRef<CustomerModel> {
  /// The parameter `appUser` of this provider.
  AppUserModel get appUser;
}

class _RefAdminCustomerNewProviderElement
    extends AutoDisposeNotifierProviderElement<RefAdminCustomerNew,
        CustomerModel> with RefAdminCustomerNewRef {
  _RefAdminCustomerNewProviderElement(super.provider);

  @override
  AppUserModel get appUser => (origin as RefAdminCustomerNewProvider).appUser;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
