import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'user.dart';

class LoggerRiverpod extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    super.didUpdateProvider(provider, previousValue, newValue, container);
    if (newValue is AsyncData<UserModel>) {
      log('${provider.name ?? provider.runtimeType} $previousValue, $newValue');
    }
  }
}
