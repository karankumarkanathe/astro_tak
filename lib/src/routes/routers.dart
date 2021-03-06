import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';
import '../features/ask_question/application/bloc/ask_question_bloc.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/profile/application/bloc/profile_bloc.dart';
import '../features/profile/presentation/profile_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    late Route<dynamic> pageRoute;
    switch (settings.name) {
      case HomeScreen.routeName:
        pageRoute = MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) =>
                      sl<AskQuestionBloc>()..add(GetQuestionCategoriesEvent()),
                  child: HomeScreen(),
                ));
        break;
      case ProfileScreen.routeName:
        pageRoute = MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      sl<ProfileBloc>()..add(GetFamilyListEvent()),
                  child: ProfileScreen(),
                ));
        break;
      default:
        pageRoute = MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => sl<AskQuestionBloc>(),
                  child: HomeScreen(),
                ));
    }
    return pageRoute;
  }
}
