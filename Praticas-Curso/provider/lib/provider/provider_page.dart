import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/user_model.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserModel>(context);

    // retorna sem ficar escutando alteraçõesf
    // var user = context.read<UserModel>();

    // var imgAvatar = context.select<UserModel, String>(
    //   (userModel) => userModel.imgAvatar,
    // );

    // var user = context.watch<UserModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
      
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.imgAvatar),
                radius: 60,
              ),

              const SizedBox(
                 height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(user.name),
                  Text(' (${user.birthDay})'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
