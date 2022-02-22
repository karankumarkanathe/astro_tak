import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../ask_question/presentation/ask_question_tab.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home_screen";
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: const Drawer(),
      body: IndexedStack(index: 2, children: _tabs),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(currentIndex: 2, items: [
      BottomNavigationBarItem(
          icon: const Icon(Icons.home), label: S.current.home),
      BottomNavigationBarItem(
          icon: const Icon(
            Icons.chat,
          ),
          label: S.current.talk),
      BottomNavigationBarItem(
          icon: const Icon(Icons.question_answer),
          label: S.current.askQuestion),
      BottomNavigationBarItem(
          icon: const Icon(Icons.report), label: S.current.reports),
      BottomNavigationBarItem(
          icon: const Icon(Icons.chat_sharp), label: S.current.chat)
    ]);
  }

  final List<Widget> _tabs = [
    Container(),
    Container(),
    AskQuestionTab(),
    Container(),
    Container(),
  ];

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(S.current.appTitle),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle))
      ],
    );
  }
}
