import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_app/modules/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:flutter_bloc_example_app/modules/edit_profile/view/edit_profile_screen.dart';
import 'package:flutter_bloc_example_app/modules/splash/view/splash_screen.dart';
import 'package:flutter_bloc_example_app/modules/user_profile/bloc/user_profile_bloc.dart';
import 'package:flutter_bloc_example_app/modules/user_profile/view/user_profile_screen.dart';

enum AppRoutes {
  splashScreen,
  userProfileScreen,
  editProfileScreen,
}

extension AppRoutesExtension on AppRoutes {
  Widget child<T extends Object>({T? arguments}) {
    switch (this) {
      case AppRoutes.splashScreen:
        return const SplashScreen();
      case AppRoutes.userProfileScreen:
        return BlocProvider(
          create: (context) => UserProfileBloc(),
          child: const UserProfileScreen(),
        );
      case AppRoutes.editProfileScreen:
        return BlocProvider(
          create: (context) => EditProfileBloc(),
          child: EditProfileScreen(defaultValue: arguments as String?,),
        );
    }
  }
}
