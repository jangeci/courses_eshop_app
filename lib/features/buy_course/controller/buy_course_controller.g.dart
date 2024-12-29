// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_course_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$buyCourseControllerHash() =>
    r'479aa800ea10878c00b848a7644d4f79a5dd4206';

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

/// See also [buyCourseController].
@ProviderFor(buyCourseController)
const buyCourseControllerProvider = BuyCourseControllerFamily();

/// See also [buyCourseController].
class BuyCourseControllerFamily extends Family<AsyncValue<String?>> {
  /// See also [buyCourseController].
  const BuyCourseControllerFamily();

  /// See also [buyCourseController].
  BuyCourseControllerProvider call({
    required int id,
  }) {
    return BuyCourseControllerProvider(
      id: id,
    );
  }

  @override
  BuyCourseControllerProvider getProviderOverride(
    covariant BuyCourseControllerProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'buyCourseControllerProvider';
}

/// See also [buyCourseController].
class BuyCourseControllerProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [buyCourseController].
  BuyCourseControllerProvider({
    required int id,
  }) : this._internal(
          (ref) => buyCourseController(
            ref as BuyCourseControllerRef,
            id: id,
          ),
          from: buyCourseControllerProvider,
          name: r'buyCourseControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$buyCourseControllerHash,
          dependencies: BuyCourseControllerFamily._dependencies,
          allTransitiveDependencies:
              BuyCourseControllerFamily._allTransitiveDependencies,
          id: id,
        );

  BuyCourseControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<String?> Function(BuyCourseControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BuyCourseControllerProvider._internal(
        (ref) => create(ref as BuyCourseControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _BuyCourseControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BuyCourseControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin BuyCourseControllerRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _BuyCourseControllerProviderElement
    extends AutoDisposeFutureProviderElement<String?>
    with BuyCourseControllerRef {
  _BuyCourseControllerProviderElement(super.provider);

  @override
  int get id => (origin as BuyCourseControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
