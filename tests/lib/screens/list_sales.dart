import 'package:flutter/material.dart';
import 'package:tests/data/dummy_data.dart';
import 'package:tests/models/sales.dart';

class ListSales extends StatefulWidget {
  const ListSales({super.key});

  @override
  State<ListSales> createState() => _ListSalesState();
}

class _ListSalesState extends State<ListSales> {
  Map<String, List<Sales>> sales = {};

  // Buscando os dados
  Future<List<Sales>> getVendas() async {
    return await dummySales;
  }

  Future<Map<String, List<Sales>>> getVendasAgrupadasPorData() async {
    final vendas = await getVendas();

    Map<String, List<Sales>> vendasAgrupadas = {};

    for (var venda in vendas) {

      String data = venda.data.split(" ")[0];

      // Organizando as chaves pela data
      if (vendasAgrupadas.containsKey(data)) {
        vendasAgrupadas[data]!.add(venda);
      } else {
        vendasAgrupadas[data] = [venda];
      }
    }

    return vendasAgrupadas;
  }

  @override
  void initState() {
    super.initState();

    Future<void> getVendasAgrupadasPorDataOrdenadas() async {
      final vendasAgrupadas = await getVendasAgrupadasPorData();

      // Obtendo e ordenando as chaves
      List<String> datasOrdenadas = vendasAgrupadas.keys.toList()..sort();
      datasOrdenadas.sort((a, b) => b.compareTo(a));

      // Criando novo map com as chaves ordenadas
      Map<String, List<Sales>> vendasAgrupadasOrdenadas = Map.fromEntries(
        datasOrdenadas.map((data) => MapEntry(data, vendasAgrupadas[data]!))
      );

      setState(() {
        sales = vendasAgrupadasOrdenadas;
      });
    }

    getVendasAgrupadasPorDataOrdenadas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listando dados'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),

        child: ListView.builder(
          itemCount: sales.entries.length,        
          itemBuilder: (_, index) {
            final entry = sales.entries.elementAt(index);
            final data = entry.key;
            final vendas = entry.value;
      
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateTime.now().day.compareTo(DateTime.parse(data).day) == 0 ? "Hoje" : data,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                
                Column(
                  children: vendas.map((venda) => Card(
                    child: ListTile(
                      title: Text(venda.name),
                      subtitle: Text('Valor: ${venda.value}'),
                    ),
                  )).toList(),
                ),

                const SizedBox(height: 10.0,)
              ],
            );
          }
        ),
      ),
    );
  }
}
