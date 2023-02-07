import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'home.dart';
import 'logger_riverpod.dart';
import 'user.dart';

part 'main.g.dart';

extension CompactMap<T> on Iterable<T?> {
  Iterable<T> compactMap<E>([
    E? Function(T?)? transform,
  ]) =>
      map(
        transform ?? (e) => e,
      ).where((e) => e != null).cast();
}

void testIt() {
  final values = [1, 2, null, 3];
  final nonNullValues = values.compactMap((e) {
    if (e != null && e > 10) {
      return e;
    } else {
      return null;
    }
  });
}

@riverpod
String name(NameRef ref) {
  return 'Grushenka';
}

@riverpod
Future<UserModel> fetchUser(
  FetchUserRef ref, {
  required String id,
  required int num,
  required bool flag,
}) {
  log('Init: fetchUser($id)');
  ref.onCancel(() => log('Cancel: fetchUser($id)'));
  ref.onResume(() => log('Resume: fetchUser($id)'));
  ref.onDispose(() => log('Dispose: fetchUser($id)'));

  final link = ref.keepAlive();
  Timer? timer;

  ref.onDispose(() => timer?.cancel());

  ref.onCancel(() {
    timer = Timer(const Duration(seconds: 10), () => link.close());
  });

  ref.onResume(() => timer?.cancel());

  return ref.watch(userRepositoryProvider).fetchUserData(id);
}

// @riverpod
// Future<UserModel> fetchUser(FetchUserRef ref, String id) {
//   log('Init: fetchUser($id)');
//   ref.onCancel(() => log('Cancel: fetchUser($id)'));
//   ref.onResume(() => log('Resume: fetchUser($id)'));
//   ref.onDispose(() => log('Dispose: fetchUser($id)'));

//   final link = ref.keepAlive();
//   Timer? timer;

//   ref.onDispose(() => timer?.cancel());

//   ref.onCancel(() {
//     timer = Timer(const Duration(seconds: 10), () => link.close());
//   });

//   ref.onResume(() => timer?.cancel());

//   return ref.watch(userRepositoryProvider).fetchUserData(id);
// }

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier(const User(name: '', age: 0));
});

final userChangeNotifierProvier =
    ChangeNotifierProvider((ref) => UserNotifierChange());

// final fetchUserProvider = FutureProvider.autoDispose.family((ref, String id) {
//   log('Init: fetchUser($id)');
// ref.onCancel(() => log('Cancel: fetchUser($id)'));
// ref.onResume(() => log('Resume: fetchUser($id)'));
// ref.onDispose(() => log('Dispose: fetchUser($id)'));

// final link = ref.keepAlive();
// Timer? timer;

// ref.onDispose(() => timer?.cancel());

// ref.onCancel(() {
//   timer = Timer(const Duration(seconds: 10), () => link.close());
// });

// ref.onResume(() => timer?.cancel());

//   return ref.watch(userRepositoryProvider).fetchUserData(id);
// }, name: 'Future Provider');

// final streamProvider = StreamProvider((ref) {
//   return Stream.periodic(const Duration(seconds: 1), (computationCnt) {
//     return computationCnt;
//   });
// });

void main() => runApp(
      ProviderScope(
        observers: [
          LoggerRiverpod(),
        ],
        child: const App(),
      ),
    );

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(),
    );
  }
}
