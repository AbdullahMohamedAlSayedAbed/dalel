import 'package:dalel/core/utils/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:  [
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut();
           GoRouter.of(context).pushReplacement(AppRouter.signUp);
          }, icon:  Icon(Icons.logout))
        ],
      ),
      body: Container(),
    );
  }
}
