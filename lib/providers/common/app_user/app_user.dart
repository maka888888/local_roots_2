import 'dart:async';

import 'package:local_roots_2/models/app_user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../auth/auth.dart';
import 'app_user_services.dart';

part 'app_user.g.dart';

@Riverpod(keepAlive: true)
class RefAppUser extends _$RefAppUser {
  @override
  Stream<AppUserModel?> build() async* {
    final auth = ref.watch(refAuthProvider);

    final StreamController<AppUserModel?> controller =
        StreamController<AppUserModel?>();

    if (auth != null) {
      AppUserModel? appUser = await ServiceAppUser().getAppUser(auth.uid);

      if (appUser == null) {
        await ServiceAppUser().createDefaultAppUser(auth);
        appUser = await ServiceAppUser().getAppUser(auth.uid);
      } else {
        appUser.lastLogin = DateTime.now();
        ServiceAppUser().updateAppUser(appUser);
      }

      ServiceAppUser().streamAppUser(auth.uid).listen((updatedAppUser) {
        controller.add(updatedAppUser);
      });
    } else {
      controller.add(null); // User logged out, send null to the stream
    }

    yield* controller.stream;
  }
}
//
// @Riverpod(keepAlive: true)
// class RefAppUser extends _$RefAppUser {
//   @override
//   Stream<AppUserModel?> build() async* {
//     final StreamController<AppUserModel?> controller =
//     StreamController<AppUserModel?>();
//
//     ref.listen<AsyncValue<User?>>(
//       refAuthProvider,
//           (previous, next) {
//         next.when(
//           data: (user) async {
//             if (user != null) {
//               AppUserModel? appUser =
//               await ServiceAppUser().getAppUser(user.uid);
//
//               if (appUser == null) {
//                 await ServiceAppUser().createDefaultAppUser(user);
//                 appUser = await ServiceAppUser().getAppUser(user.uid);
//               } else {
//                 appUser.lastLogin = DateTime.now();
//                 ServiceAppUser().updateAppUser(appUser);
//               }
//
//               ServiceAppUser().streamAppUser(user.uid).listen((updatedAppUser) {
//                 controller.add(updatedAppUser);
//               });
//             } else {
//               controller.add(null); // User logged out, send null to the stream
//             }
//           },
//           error: (err, stack) {
//             print('RefAppUser Error: $err');
//             controller.addError(err, stack);
//           },
//           loading: () {
//             print('RefAppUser Loading');
//             controller.add(null); // Add null while loading
//           },
//         );
//       },
//     );
//
//     yield* controller.stream;
//
//     await controller.close();
//   }
// }
