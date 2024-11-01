// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_customer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$refCustomerNewHash() => r'15c1e5f598d6dd61ef4ddcaa9af266e6b6f7e6ec';

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

abstract class _$RefCustomerNew
    extends BuildlessAutoDisposeNotifier<CustomerModel> {
  late final bool isCreatingAdmin;

  CustomerModel build(
    bool isCreatingAdmin,
  );
}

/// See also [RefCustomerNew].
@ProviderFor(RefCustomerNew)
const refCustomerNewProvider = RefCustomerNewFamily();

/// See also [RefCustomerNew].
class RefCustomerNewFamily extends Family<CustomerModel> {
  /// See also [RefCustomerNew].
  const RefCustomerNewFamily();

  /// See also [RefCustomerNew].
  RefCustomerNewProvider call(
    bool isCreatingAdmin,
  ) {
    return RefCustomerNewProvider(
      isCreatingAdmin,
    );
  }

  @override
  RefCustomerNewProvider getProviderOverride(
    covariant RefCustomerNewProvider provider,
  ) {
    return call(
      provider.isCreatingAdmin,
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
  String? get name => r'refCustomerNewProvider';
}

/// See also [RefCustomerNew].
class RefCustomerNewProvider
    extends AutoDisposeNotifierProviderImpl<RefCustomerNew, CustomerModel> {
  /// See also [RefCustomerNew].
  RefCustomerNewProvider(
    bool isCreatingAdmin,
  ) : this._internal(
          () => RefCustomerNew()..isCreatingAdmin = isCreatingAdmin,
          from: refCustomerNewProvider,
          name: r'refCustomerNewProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$refCustomerNewHash,
          dependencies: RefCustomerNewFamily._dependencies,
          allTransitiveDependencies:
              RefCustomerNewFamily._allTransitiveDependencies,
          isCreatingAdmin: isCreatingAdmin,
        );

  RefCustomerNewProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.isCreatingAdmin,
  }) : super.internal();

  final bool isCreatingAdmin;

  @override
  CustomerModel runNotifierBuild(
    covariant RefCustomerNew notifier,
  ) {
    return notifier.build(
      isCreatingAdmin,
    );
  }

  @override
  Override overrideWith(RefCustomerNew Function() create) {
    return ProviderOverride(
      origin: this,
      override: RefCustomerNewProvider._internal(
        () => create()..isCreatingAdmin = isCreatingAdmin,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        isCreatingAdmin: isCreatingAdmin,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<RefCustomerNew, CustomerModel>
      createElement() {
    return _RefCustomerNewProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RefCustomerNewProvider &&
        other.isCreatingAdmin == isCreatingAdmin;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, isCreatingAdmin.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RefCustomerNewRef on AutoDisposeNotifierProviderRef<CustomerModel> {
  /// The parameter `isCreatingAdmin` of this provider.
  bool get isCreatingAdmin;
}

class _RefCustomerNewProviderElement
    extends AutoDisposeNotifierProviderElement<RefCustomerNew, CustomerModel>
    with RefCustomerNewRef {
  _RefCustomerNewProviderElement(super.provider);

  @override
  bool get isCreatingAdmin =>
      (origin as RefCustomerNewProvider).isCreatingAdmin;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
