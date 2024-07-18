import 'package:dalel/features/Auth/presentation/views/sign_in_view.dart';
import 'package:dalel/features/Auth/presentation/views/sing_up_view.dart';
import 'package:dalel/features/onBoarding/presentation/views/onBoarding_view.dart';
import 'package:dalel/features/splash/views/splash_view.dart';
import 'package:go_router/go_router.dart';
class AppRouter {
  static const onBoarding = '/OnBoarding';
  static const signUp = '/SignUp';
  static const signIn = '/SignIn';
 static final GoRouter router = GoRouter(
  
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: onBoarding,
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: signUp,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: signIn,
      builder: (context, state) => const SignInView(),
    ),
  ],
);
}

