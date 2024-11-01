import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_stream.g.dart';

@Riverpod(keepAlive: true)
class RefAuthStream extends _$RefAuthStream {
  @override
  Stream<User?> build() {
    return FirebaseAuth.instance.authStateChanges();
  }
}
