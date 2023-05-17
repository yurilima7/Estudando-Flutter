import 'package:flutter/material.dart';

enum PopupMenuPages { container, mediaQuery, singleChild, lisview }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          PopupMenuButton(
            tooltip: 'Selecione',
            onSelected: (PopupMenuPages value) {
              switch (value) {
                case PopupMenuPages.container:
                  Navigator.of(context).pushNamed('/container');
                  break;
                case PopupMenuPages.mediaQuery:
                  Navigator.of(context).pushNamed('/media_query');
                  break;
                case PopupMenuPages.singleChild:
                  Navigator.of(context).pushNamed('/singleChild');
                  break;
                case PopupMenuPages.lisview:
                  Navigator.of(context).pushNamed('/listview');
                  break;
                default:
              }
            },
            itemBuilder: (context) {
              return <PopupMenuItem<PopupMenuPages>>[
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.container,
                  child: Text('Container'),
                ),
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.mediaQuery,
                  child: Text('MediaQuery'),
                ),
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.singleChild,
                  child: Text('SingleChild'),
                ),
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.lisview,
                  child: Text('ListView'),
                ),
              ];
            },
          )
        ],
      ),
      body: Container(),
    );
  }
}
