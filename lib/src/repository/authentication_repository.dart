import 'package:capture_post/screens/dashboard_screen.dart';
import 'package:capture_post/screens/login_screen.dart';
import 'package:capture_post/src/exceptions/SignInFailureWithEmailAndPassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Authentication extends GetxController {
  static Authentication get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady()async {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever (firebaseUser, (User? user) => _setinitialScreen(user));
  }

  _setinitialScreen(User? user)  {
    user == null
        ?  Get.offAll(() => const LoginScreen())
        :  Get.offAll(() => const DashboardScreen());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const DashboardScreen())
          : Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignInFailureWithEmailAndPassword.code(e.code);
      print("AuthException - ${ex.message}");
      throw ex;
    } catch (_) {
      final ex = SignInFailureWithEmailAndPassword();
      print("AuthException - ${ex.message}");
      throw ex;
    }
  }

  Future<void> signInWithUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const DashboardScreen())
          : Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      if(e.code=="email-already-in-use"){

      }
      else{
        Get.snackbar('Error', "Invalid");
      }
    } 
  }
  // Future<void> signInWithUserWithPhoneNumberAndPassword(
  //     String phoneNumber, String password) async {
  //   try {
  //     await _auth.s;
  //     firebaseUser.value != null
  //         ? Get.offAll(() => const DashboardScreen())
  //         : Get.offAll(() => const LoginScreen());
  //   } on FirebaseAuthException catch (e) {
  //     if(e.code=="email-already-in-use"){

  //     }
  //     else{
  //       Get.snackbar('Error', "Invalid");
  //     }
  //   } 
  // }

  void phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          // if (e.code == "Invalid-phone-number") {
          //   Get.snackbar('Error', "The provided phone number is not valid");
          // } else {
          //   Get.snackbar('Error', "Something went wrong try again");
          // }
        },
        codeSent: (verificationId, forceResendingToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        });
  }

  Future<bool> verifyOtp(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            smsCode: otp, verificationId: this.verificationId.value));
    return credentials.user != null ? true : false;
  }

  Future<void> logout() async {
    return await _auth.signOut();

  }
}
