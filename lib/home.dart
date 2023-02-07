import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'main.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller1 = useTextEditingController();
    final controller2 = useTextEditingController();
    var userId = '1';

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Container(
        child: Center(
          child: Consumer(
            builder: (context, ref, child) {
              final user = ref.watch(fetchUserProvider(userId));
              final streamNum = ref.watch(streamProvider);

              // return user.when(
              //   data: (data) {
              //     return Column(
              //       children: [
              //         Text(data.name),
              //         Text(data.email),
              //       ],
              //     );
              //   },
              //   error: (err, stackTrace) {
              //     return Text(err.toString());
              //   },
              //   loading: () => const CircularProgressIndicator(),
              // );
              // final user = ref.watch(userChangeNotifierProvier).user =
              //     const User(name: '', age: 0);

              // ref.listen(userProvider.select((value) => value.age),
              //     ((prevState, currState) {
              //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //     content: Text(
              //         'Our age was $prevState and the new age is $currState'),
              //   ));
              // }));

              return user.when(
                data: (data) => Column(
                  children: [
                    TextField(
                      controller: controller1,
                      onSubmitted: (value) {
                        userId = value;
                      },
                    ),
                    Text(data.name),
                  ],
                ),
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
