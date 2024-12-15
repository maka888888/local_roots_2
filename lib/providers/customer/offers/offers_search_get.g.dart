// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_search_get.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$refCustomerSearchGetHash() =>
    r'094b24253cce03b9dd7738014eb22e210598ecf4';

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

abstract class _$RefCustomerSearchGet
    extends BuildlessAutoDisposeAsyncNotifier<List<OfferModel>> {
  late final List<String> categories;
  late final String searchText;

  FutureOr<List<OfferModel>> build(
    List<String> categories,
    String searchText,
  );
}

/// See also [RefCustomerSearchGet].
@ProviderFor(RefCustomerSearchGet)
const refCustomerSearchGetProvider = RefCustomerSearchGetFamily();

/// See also [RefCustomerSearchGet].
class RefCustomerSearchGetFamily extends Family<AsyncValue<List<OfferModel>>> {
  /// See also [RefCustomerSearchGet].
  const RefCustomerSearchGetFamily();

  /// See also [RefCustomerSearchGet].
  RefCustomerSearchGetProvider call(
    List<String> categories,
    String searchText,
  ) {
    return RefCustomerSearchGetProvider(
      categories,
      searchText,
    );
  }

  @override
  RefCustomerSearchGetProvider getProviderOverride(
    covariant RefCustomerSearchGetProvider provider,
  ) {
    return call(
      provider.categories,
      provider.searchText,
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
  String? get name => r'refCustomerSearchGetProvider';
}

/// See also [RefCustomerSearchGet].
class RefCustomerSearchGetProvider extends AutoDisposeAsyncNotifierProviderImpl<
    RefCustomerSearchGet, List<OfferModel>> {
  /// See also [RefCustomerSearchGet].
  RefCustomerSearchGetProvider(
    List<String> categories,
    String searchText,
  ) : this._internal(
          () => RefCustomerSearchGet()
            ..categories = categories
            ..searchText = searchText,
          from: refCustomerSearchGetProvider,
          name: r'refCustomerSearchGetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$refCustomerSearchGetHash,
          dependencies: RefCustomerSearchGetFamily._dependencies,
          allTransitiveDependencies:
              RefCustomerSearchGetFamily._allTransitiveDependencies,
          categories: categories,
          searchText: searchText,
        );

  RefCustomerSearchGetProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categories,
    required this.searchText,
  }) : super.internal();

  final List<String> categories;
  final String searchText;

  @override
  FutureOr<List<OfferModel>> runNotifierBuild(
    covariant RefCustomerSearchGet notifier,
  ) {
    return notifier.build(
      categories,
      searchText,
    );
  }

  @override
  Override overrideWith(RefCustomerSearchGet Function() create) {
    return ProviderOverride(
      origin: this,
      override: RefCustomerSearchGetProvider._internal(
        () => create()
          ..categories = categories
          ..searchText = searchText,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categories: categories,
        searchText: searchText,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RefCustomerSearchGet,
      List<OfferModel>> createElement() {
    return _RefCustomerSearchGetProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RefCustomerSearchGetProvider &&
        other.categories == categories &&
        other.searchText == searchText;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categories.hashCode);
    hash = _SystemHash.combine(hash, searchText.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RefCustomerSearchGetRef
    on AutoDisposeAsyncNotifierProviderRef<List<OfferModel>> {
  /// The parameter `categories` of this provider.
  List<String> get categories;

  /// The parameter `searchText` of this provider.
  String get searchText;
}

class _RefCustomerSearchGetProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RefCustomerSearchGet,
        List<OfferModel>> with RefCustomerSearchGetRef {
  _RefCustomerSearchGetProviderElement(super.provider);

  @override
  List<String> get categories =>
      (origin as RefCustomerSearchGetProvider).categories;
  @override
  String get searchText => (origin as RefCustomerSearchGetProvider).searchText;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
