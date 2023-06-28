import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nagisa_talk/chatPage.dart';
import 'package:nagisa_talk/studentsListPage.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int _selectedIndex = 0;
  static List<Widget> _pageList = [
    ChatPage(),
    StudentsListPage()
  ];

  void _onDestinationSelected(int index){
    setState( (){
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: _pageList[_selectedIndex]
      ),
      bottomNavigationBar: NavigationBar(
        animationDuration: Duration(milliseconds: 500),
        onDestinationSelected: (int index){
          _onDestinationSelected(index);
        },
        selectedIndex: _selectedIndex,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            label: AppLocalizations.of(context)!.bNavBarChat,
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: AppLocalizations.of(context)!.bNavBarStudents,
          )
        ],
      ),
    );
  }
}