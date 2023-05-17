import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/change_notifier/provider_controller.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({super.key});

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 2));
      context.read<ProviderController>().alterarDados();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier'),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Selector<ProviderController, String>(
                selector: (_, controller) => controller.imgAvatar,
                builder: (_, imgAvatar, __) {
                  return CircleAvatar(
                    backgroundImage: NetworkImage(imgAvatar),
                    radius: 60,
                  );
                },
              ),

              const SizedBox(
                height: 20,
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Selector<ProviderController, String>(
                    selector: (_, controller) => controller.name,
                    builder: (_, name, __) {
                      return Text(name);
                    },
                  ),

                  Selector<ProviderController, String>(
                    selector: (_, controller) => controller.birthDay,
                    builder: (_, birthDay, __) {
                      return Text(' ($birthDay)');
                    },
                  ),
                ],
              ),

              ElevatedButton(
                onPressed: () =>
                    context.read<ProviderController>().alterarNome(),
                child: const Text('Alterar Nome'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
