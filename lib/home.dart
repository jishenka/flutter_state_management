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

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Container(
        child: Center(
          child: Consumer(
            builder: (context, ref, child) {
              final user =
                  ref.watch(userProvider.select((value) => value.name));

              ref.listen(userProvider.select((value) => value.age),
                  ((prevState, currState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'Our age was $prevState and the new age is $currState'),
                ));
              }));

              return Column(
                children: [
                  // TextButton(
                  //   onPressed: () {
                  //     ref.watch(nameProvider.notifier).state = 'Grusha';
                  //   },
                  //   child: const Text('Click'),
                  // ),
                  TextField(
                    controller: controller1,
                    onSubmitted: (value) {
                      ref.read(userProvider.notifier).updateName(value);
                    },
                  ),
                  TextField(
                    controller: controller2,
                    onSubmitted: (value) {
                      ref
                          .read(userProvider.notifier)
                          .updateAge(int.parse(value));
                    },
                  ),
                  Text(user)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
