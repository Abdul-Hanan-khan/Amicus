
import 'package:amicus/core/routes/app_routes.dart';
import 'package:amicus/modules/authentication/bindings/authentication_bindings.dart';
import 'package:amicus/modules/authentication/view/forgot_password/forgot_password.dart';
import 'package:amicus/modules/authentication/view/forgot_password/reset_password.dart';
import 'package:amicus/modules/authentication/view/login.dart';
import 'package:amicus/modules/authentication/view/register/otp_screen.dart';
import 'package:amicus/modules/authentication/view/register/register.dart';
import 'package:amicus/modules/dashboard/Landing/view/dashboard.dart';
import 'package:amicus/modules/dashboard/bindings/dashboard_bindings.dart';
import 'package:amicus/modules/dashboard/home/earnings/view/bounty_details.dart';
import 'package:amicus/modules/dashboard/home/earnings/view/my_earnings.dart';
import 'package:amicus/modules/dashboard/profile/bindings/profile_bindings.dart';
import 'package:amicus/modules/dashboard/profile/change_password/change_password.dart';
import 'package:amicus/modules/dashboard/profile/landing/view/edit_profile.dart';
import 'package:amicus/modules/dashboard/profile/terms/view/terms.dart';
import 'package:amicus/modules/dashboard/report/view/report.dart';
import 'package:amicus/modules/notification/binding/notification_binding.dart';
import 'package:amicus/modules/notification/view/notification.dart';
import 'package:amicus/modules/onboarding/bindings/onboarding_bindings.dart';
import 'package:amicus/modules/onboarding/view/onboarding.dart';
import 'package:amicus/modules/onboarding/view/splash_screen.dart';

import 'package:get/get.dart';


class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.landing,
      page: () => OnboardingView(),
      binding: OnBoardingBindings(),
    ),

    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
      // binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterScreen(),
      binding: AuthenticationBindings(),
    ),
    GetPage(
      name: AppRoutes.otpScreen,
      page: () => OtpScreen(),
    ),

    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => ForgotPassword(),
      binding: AuthenticationBindings()
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => ResetPassword(),
    ),

    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardView(),
      binding: DashboardBindings(),
      transition: Transition.noTransition
    ),

    GetPage(
      name: AppRoutes.editProfile,
      page: () => EditProfileView(),
      binding: ProfileBindings()
    ),

    GetPage(
      name: AppRoutes.report,
      page: () => ReportScreen(),
      transition: Transition.downToUp
    ),

    GetPage(
      name: AppRoutes.myEarnings,
      page: () => MyEarnings(),
    ),

    GetPage(
      name: AppRoutes.bountyDetails,
      page: () => BountyDetails(),
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () => Notification(),
      binding: NotificationBinding()
    ),

    GetPage(
        name: AppRoutes.editProfile,
        page: () => EditProfileView(),
        binding: ProfileBindings()
    ),

    GetPage(
        name: AppRoutes.changePasswordScreen,
        page: () => ChangePasswordScreen(),
        binding: ProfileBindings()
    ),
    GetPage(
        name: AppRoutes.termsNConditions,
        page: () => TermsView(),
        binding: ProfileBindings()
    ),
  ];
}