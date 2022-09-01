import 'package:flutter/material.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {

  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.onSettingsChanged, this.settings, {Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  @override
  Widget build(BuildContext context) {
    // switch de opções de filtro
    Widget _createSwitch(
      String title, 
      String subtitle, 
      bool value, 
      Function(bool) onChanged,
    ) {
      return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value, 

        onChanged: (value) {
          onChanged(value); // altera as configurações
          widget.onSettingsChanged(settings); // repassa as configurações
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
      ),

      drawer: const MainDrawer(),

      body: Column(
        children: [

          Container(
            padding: const EdgeInsets.all(20),

            child: Text(
              "Configurações",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),

          Expanded(
            child: ListView(
              children: [
                // chamando o switch de opções de filtro
                _createSwitch(
                  "Sem Glutén",
                  "Só exibe refeições sem glúten",
                  settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = value),
                ),
                // chamando o switch de opções de filtro
                _createSwitch(
                  "Sem Lactose",
                  "Só exibe refeições sem lactose",
                  settings.isLactoseFree,
                  (value) => setState(() => settings.isLactoseFree = value),
                ),
                // chamando o switch de opções de filtro
                _createSwitch(
                  "Vegana",
                  "Só exibe refeições veganas",
                  settings.isVegan,
                  (value) => setState(() => settings.isVegan = value),
                ),
                // chamando o switch de opções de filtro
                _createSwitch(
                  "Vegetariana",
                  "Só exibe refeições vegetarianas",
                  settings.isVegetarian,
                  (value) => setState(() => settings.isVegetarian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
