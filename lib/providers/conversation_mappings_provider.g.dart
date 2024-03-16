// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_mappings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchConversationMappingsHash() =>
    r'3529e1358c9731ef26550708824dfbe5cef959f1';

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

/// See also [fetchConversationMappings].
@ProviderFor(fetchConversationMappings)
const fetchConversationMappingsProvider = FetchConversationMappingsFamily();

/// See also [fetchConversationMappings].
class FetchConversationMappingsFamily
    extends Family<List<ConversationUserMapping>> {
  /// See also [fetchConversationMappings].
  const FetchConversationMappingsFamily();

  /// See also [fetchConversationMappings].
  FetchConversationMappingsProvider call(
    Archive archive,
  ) {
    return FetchConversationMappingsProvider(
      archive,
    );
  }

  @override
  FetchConversationMappingsProvider getProviderOverride(
    covariant FetchConversationMappingsProvider provider,
  ) {
    return call(
      provider.archive,
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
  String? get name => r'fetchConversationMappingsProvider';
}

/// See also [fetchConversationMappings].
class FetchConversationMappingsProvider
    extends AutoDisposeProvider<List<ConversationUserMapping>> {
  /// See also [fetchConversationMappings].
  FetchConversationMappingsProvider(
    Archive archive,
  ) : this._internal(
          (ref) => fetchConversationMappings(
            ref as FetchConversationMappingsRef,
            archive,
          ),
          from: fetchConversationMappingsProvider,
          name: r'fetchConversationMappingsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchConversationMappingsHash,
          dependencies: FetchConversationMappingsFamily._dependencies,
          allTransitiveDependencies:
              FetchConversationMappingsFamily._allTransitiveDependencies,
          archive: archive,
        );

  FetchConversationMappingsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.archive,
  }) : super.internal();

  final Archive archive;

  @override
  Override overrideWith(
    List<ConversationUserMapping> Function(
            FetchConversationMappingsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchConversationMappingsProvider._internal(
        (ref) => create(ref as FetchConversationMappingsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        archive: archive,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<ConversationUserMapping>> createElement() {
    return _FetchConversationMappingsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchConversationMappingsProvider &&
        other.archive == archive;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, archive.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchConversationMappingsRef
    on AutoDisposeProviderRef<List<ConversationUserMapping>> {
  /// The parameter `archive` of this provider.
  Archive get archive;
}

class _FetchConversationMappingsProviderElement
    extends AutoDisposeProviderElement<List<ConversationUserMapping>>
    with FetchConversationMappingsRef {
  _FetchConversationMappingsProviderElement(super.provider);

  @override
  Archive get archive => (origin as FetchConversationMappingsProvider).archive;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
