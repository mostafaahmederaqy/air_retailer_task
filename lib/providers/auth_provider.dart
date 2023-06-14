import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../models/user_model.dart';

enum Status {
  uninitialized,
  authenticated,
  authenticating,
  unauthenticated,
  registering
}

class AuthProvider extends ChangeNotifier {
  late FirebaseAuth _auth;
  Status _status = Status.uninitialized;

  Status get status => _status;

  Stream<UserModel?> get user =>
      _auth.authStateChanges().map(_userFromFirebase);

  AuthProvider() {
    _auth = FirebaseAuth.instance;

    _auth.authStateChanges().listen(onAuthStateChanged);
  }
  UserModel? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    }

    return UserModel(
      user.uid,
      user.email,
    );
  }

  Future<void> onAuthStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.unauthenticated;
    } else {
      _userFromFirebase(firebaseUser);
      _status = Status.authenticated;
    }
    notifyListeners();
  }

  Future<UserModel?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      _status = Status.registering;
      notifyListeners();
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      notifyListeners();

      return _userFromFirebase(result.user);
    } catch (e) {
      if (kDebugMode) {
        print("Error on the new user registration = $e");
      }
      _status = Status.unauthenticated;
      notifyListeners();
    }
    return null;
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      _status = Status.authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      if (kDebugMode) {
        print("Error on the sign in = $e");
      }
      _status = Status.unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }
}
