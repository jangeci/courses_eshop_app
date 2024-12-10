// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$courseDetailControllerHash() =>
    r'ad69f1329b377929a5e4af52018e35b5af9cc8ba';

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

/// See also [courseDetailController].
@ProviderFor(courseDetailController)
const courseDetailControllerProvider = CourseDetailControllerFamily();

/// See also [courseDetailController].
class CourseDetailControllerFamily extends Family<AsyncValue<CourseItem?>> {
  /// See also [courseDetailController].
  const CourseDetailControllerFamily();

  /// See also [courseDetailController].
  CourseDetailControllerProvider call({
    required int id,
  }) {
    return CourseDetailControllerProvider(
      id: id,
    );
  }

  @override
  CourseDetailControllerProvider getProviderOverride(
    covariant CourseDetailControllerProvider provider,
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
  String? get name => r'courseDetailControllerProvider';
}

/// See also [courseDetailController].
class CourseDetailControllerProvider
    extends AutoDisposeFutureProvider<CourseItem?> {
  /// See also [courseDetailController].
  CourseDetailControllerProvider({
    required int id,
  }) : this._internal(
          (ref) => courseDetailController(
            ref as CourseDetailControllerRef,
            id: id,
          ),
          from: courseDetailControllerProvider,
          name: r'courseDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$courseDetailControllerHash,
          dependencies: CourseDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              CourseDetailControllerFamily._allTransitiveDependencies,
          id: id,
        );

  CourseDetailControllerProvider._internal(
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
    FutureOr<CourseItem?> Function(CourseDetailControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CourseDetailControllerProvider._internal(
        (ref) => create(ref as CourseDetailControllerRef),
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
  AutoDisposeFutureProviderElement<CourseItem?> createElement() {
    return _CourseDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CourseDetailControllerProvider && other.id == id;
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
mixin CourseDetailControllerRef on AutoDisposeFutureProviderRef<CourseItem?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _CourseDetailControllerProviderElement
    extends AutoDisposeFutureProviderElement<CourseItem?>
    with CourseDetailControllerRef {
  _CourseDetailControllerProviderElement(super.provider);

  @override
  int get id => (origin as CourseDetailControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
