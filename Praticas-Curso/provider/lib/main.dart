import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/change_notifier/change_notifier_page.dart';
import 'package:provider_example/change_notifier/provider_controller.dart';
import 'package:provider_example/provider/provider_page.dart';
import 'package:provider_example/provider/user_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) {
            return UserModel(
              name: 'Hunter',
              imgAvatar: 'https://pbs.twimg.com/media/Evh5xcjUUAIfHRK.jpg',
              birthDay: '27/03/2002',
            );
          },
        ),

        ChangeNotifierProvider(create: (_) => ProviderController()),
      ],

      child: MaterialApp(
        routes: {
          '/provider':(context) => const ProviderPage(),
          '/change':(context) => const ChangeNotifierPage(),
        },
        
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pushNamed('/provider'),
                      child: const Text('Provider'),
                    ),
                    
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pushNamed('/change'),
                      child: const Text('Change Notifier'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
