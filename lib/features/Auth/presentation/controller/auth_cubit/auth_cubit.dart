
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  late String? fistName;
  late String? lastName;
  late String? emailAddress;
  late String? password;
  bool termsAndConditionBox = false;
  bool isPasswordVisible = false;
  IconData suffix = Icons.visibility_outlined;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> signUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoading());
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!.trim(),
        password: password!.trim(),
      );
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailure('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailure('The account already exists for that email.'));
      }
    } catch (e) {
      print(e);
      emit(SignUpFailure(e.toString()));
    }
  }

  updateTermsAndConditionBox({required bool value}) {
    termsAndConditionBox = value;
    emit(UpdateTermsAndConditionBox());
  }

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    suffix = isPasswordVisible
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibility());
  }

  Future<void> signInWithEmailAndPassword() async {
    emit(SignInLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!.trim(),
        password: password!.trim(),
      );
      emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailure('No user found for that email.'));
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        emit(SignInFailure('Wrong password provided for that user.'));
        print('Wrong password provided for that user.');
      }
    }
  }
}
