import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ServicesAuth {
  Stream<User?> streamAuthStateChanges() {
    return FirebaseAuth.instance.authStateChanges();
  }

  Future<UserCredential?> createUserWithEmailAndPassword(
      BuildContext context, String emailAddress, String password) async {
    UserCredential? userCredential;
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((value) {
        userCredential = value;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                '${AppLocalizations.of(context)!.error}: The password provided is too weak.'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                '${AppLocalizations.of(context)!.error}: The account already exists for that email.'),
          ),
        );
      } else {
        debugPrint(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('${AppLocalizations.of(context)!.error}: ${e.toString()}'),
          ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return userCredential;
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      BuildContext context, String emailAddress, String password) async {
    UserCredential? userCredential;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((value) {
        userCredential = value;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                '${AppLocalizations.of(context)!.error}: No user found for that email.'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                '${AppLocalizations.of(context)!.error}: Wrong password provided for that user.'),
          ),
        );
      } else {
        debugPrint(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('${AppLocalizations.of(context)!.error}: ${e.toString()}'),
          ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return userCredential;
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
