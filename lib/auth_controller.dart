import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  // Future<void> signInAnonymously() async {
  //   final authRepository = ref.read(authRepositoryProvider);
  //   state = const AsyncLoading();
  //   state = await AsyncValue.gaurd(authRepository.signInAnonymously);
  // }
}
