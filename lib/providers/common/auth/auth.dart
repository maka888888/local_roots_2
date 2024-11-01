import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_stream.dart';

part 'auth.g.dart';

@Riverpod(keepAlive: true)
class RefAuth extends _$RefAuth {
  @override
  User? build() {
    //return null;
    final authStream = ref.watch(refAuthStreamProvider);

    return authStream.valueOrNull;
  }

  updateState(User? user) {
    state = user;
  }
}
