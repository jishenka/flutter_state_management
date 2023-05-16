import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'user.dart';

final userProvider =
    FutureProvider.autoDispose.family<UserModel?, int>((ref, userId) async {
  final res = await Future.delayed(const Duration(seconds: 3),
      () => ref.watch(userRepositoryProvider).fetchUserData(userId.toString()));
  return res;
});

class LoadingScreen extends HookConsumerWidget {
  const LoadingScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final idx = useState<int>(0);
    final user = ref.watch(userProvider(1));
    Timer? timer;

    useEffect(() {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        idx.value++;
      });
      return timer?.cancel;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading...'),
      ),
      body: Container(
        color: Colors.white,
        width: size.width,
        height: size.height,
        child: Center(
          child: user.when(
            loading: () => Text(
              idx.value.toString(),
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w700,
              ),
            ),
            data: (data) => Text(
              data != null ? data.name : 'No data',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w700,
              ),
            ),
            error: (error, stackTrace) => const Text(
              'Error',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w700,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
