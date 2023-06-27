import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nagisa_talk/chatPage.dart';

class HomePage extends StatelessWidget{
  @override
  int _selectedIndex = 0;
  static List<Widget> _pageList = [
    ChatPage(),

  ];
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: ChatPage()
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: AppLocalizations.of(context)!.bNavBarChat,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: AppLocalizations.of(context)!.bNavBarStudents,
          )
        ],
      ),
    );
  }
}