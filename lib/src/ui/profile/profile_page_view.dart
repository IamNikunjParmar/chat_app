import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/login/login_page_cubit.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

  static const String routeName = 'profile_page_view';
  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginPageCubit(),
      child: const ProfilePageView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
