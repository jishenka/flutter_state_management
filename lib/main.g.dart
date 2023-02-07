// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String _$nameHash() => r'55e6726457b22acc22c418e0d0e036a127396336';

/// See also [name].
final nameProvider = AutoDisposeProvider<String>(
  name,
  name: r'nameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$nameHash,
);
typedef NameRef = AutoDisposeProviderRef<String>;
String _$fetchUserHash() => r'7a59a8c9047184e80a207a6fb6c0f24e9278e040';

/// See also [fetchUser].
class FetchUserProvider extends AutoDisposeFutureProvider<UserModel> {
  FetchUserProvider({
    required this.id,
    required this.num,
    required this.flag,
  }) : super(
          (ref) => fetchUser(
            ref,
            id: id,
            num: num,
            flag: flag,
          ),
          from: fetchUserProvider,
          name: r'fetchUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchUserHash,
        );

  final String id;
  final int num;
  final bool flag;

  @override
  bool operator ==(Object other) {
    return other is FetchUserProvider &&
        other.id == id &&
        other.num == num &&
        other.flag == flag;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, num.hashCode);
    hash = _SystemHash.combine(hash, flag.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef FetchUserRef = AutoDisposeFutureProviderRef<UserModel>;

/// See also [fetchUser].
final fetchUserProvider = FetchUserFamily();

class FetchUserFamily extends Family<AsyncValue<UserModel>> {
  FetchUserFamily();

  FetchUserProvider call({
    required String id,
    required int num,
    required bool flag,
  }) {
    return FetchUserProvider(
      id: id,
      num: num,
      flag: flag,
    );
  }

  @override
  AutoDisposeFutureProvider<UserModel> getProviderOverride(
    covariant FetchUserProvider provider,
  ) {
    return call(
      id: provider.id,
      num: provider.num,
      flag: provider.flag,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'fetchUserProvider';
}
