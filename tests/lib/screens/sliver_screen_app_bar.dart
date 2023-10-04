import 'dart:developer';

import 'package:flutter/material.dart';

class SliverScreenAppBar extends StatelessWidget {

  const SliverScreenAppBar({ super.key });

  @override
  Widget build(BuildContext context) {
    log(MediaQuery.of(context).devicePixelRatio.toString());
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            // toolbarHeight: 200,
            pinned: true,
            automaticallyImplyLeading: true,
            floating: false,
            // backgroundColor: Colors.transparent,

            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
            ),

            flexibleSpace: FlexibleSpaceBar(
              // centerTitle: true,
              title: const Text(
                'Produto',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://cdn.pixabay.com/photo/2016/12/26/17/28/spaghetti-1932466_1280.jpg',
                    fit: BoxFit.cover,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(20),

                  child: Column(
                    children: const [
                      // SizedBox(height: 16),
                      
                      SizedBox(height: 8),
                      Text(
                        'Product',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Ingredientes:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('- 300g de espaguete'),
                      Text('- 4 tomates maduros'),
                      Text('- 3 dentes de alho'),
                      Text('- Azeite de oliva extra virgem'),
                      Text('- Sal a gosto'),
                      Text('- Pimenta-do-reino a gosto'),
                      Text('- Folhas de manjericão fresco'),
                      Text('- Queijo parmesão ralado (opcional)'),
                      SizedBox(height: 30),
                      Text(
                        'Instruções:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('1. Comece preparando os ingredientes...'),
                      Text('2. Em uma panela grande, aqueça água com sal e cozinhe o espaguete...'),
                      Text('3. Enquanto o espaguete cozinha, aqueça uma frigideira grande em fogo médio-alto...'),
                      Text('4. Acrescente os cubos de tomate à frigideira e tempere com sal e pimenta-do-reino a gosto...'),
                      Text('5. Escorra o espaguete cozido e adicione-o diretamente na frigideira com os tomates...'),
                      Text('6. Desligue o fogo e adicione as folhas de manjericão rasgadas...'),
                      Text('7. Sirva o espaguete com tomates e manjericão em pratos individuais...'),
                      SizedBox(height: 30),
                      Text(
                        'Instruções:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('1. Comece preparando os ingredientes...'),
                      Text('2. Em uma panela grande, aqueça água com sal e cozinhe o espaguete...'),
                      Text('3. Enquanto o espaguete cozinha, aqueça uma frigideira grande em fogo médio-alto...'),
                      Text('4. Acrescente os cubos de tomate à frigideira e tempere com sal e pimenta-do-reino a gosto...'),
                      Text('5. Escorra o espaguete cozido e adicione-o diretamente na frigideira com os tomates...'),
                      Text('6. Desligue o fogo e adicione as folhas de manjericão rasgadas...'),
                      Text('7. Sirva o espaguete com tomates e manjericão em pratos individuais...'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}