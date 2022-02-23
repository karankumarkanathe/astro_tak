import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../values/assets.dart';
import '../../ask_question/presentation/ask_question_tab.dart';
import '../../profile/presentation/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home_screen";
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: IndexedStack(index: 2, children: _tabs),
        bottomNavigationBar: _buildBottomNavigationBar(context),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(currentIndex: 2, items: [
      BottomNavigationBarItem(
          icon: Image.asset(
            Assets.home,
            color: Colors.grey,
          ),
          label: S.current.home),
      BottomNavigationBarItem(
          icon: Image.asset(Assets.talk), label: S.current.talk),
      BottomNavigationBarItem(
          icon: Image.asset(
            Assets.ask,
            color: Theme.of(context).primaryColor,
          ),
          label: S.current.askQuestion),
      BottomNavigationBarItem(
          icon: Image.asset(Assets.reports), label: S.current.reports),
      BottomNavigationBarItem(
          icon: Image.asset(Assets.chat), label: S.current.chat)
    ]);
  }

  final List<Widget> _tabs = [
    Container(),
    Container(),
    AskQuestionTab(),
    Container(),
    Container(),
  ];

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Image.asset(
        Assets.logo,
        height: 50,
      ),
      leading: IconButton(
        onPressed: () {},
        icon: Image.asset(
          Assets.hamburger,
          scale: 2,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, ProfileScreen.routeName);
          },
          icon: Image.asset(
            Assets.profile,
            height: 20,
          ),
        )
      ],
    );
  }
}
