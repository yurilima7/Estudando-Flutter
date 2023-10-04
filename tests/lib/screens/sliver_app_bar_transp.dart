import 'package:flutter/material.dart';

class SliverAppBarTransp extends StatelessWidget {
  const SliverAppBarTransp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),

                sliver: SliverAppBar(
                  expandedHeight: 200,
                  pinned: true,
                  // backgroundColor: Colors.transparent,
                  
                  
                  flexibleSpace: FlexibleSpaceBar(
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
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.5),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: const Text(
                          'Nome do Produto',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                )
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              ListView(
                children: [
                  // Conteúdo da primeira aba
                ],
              ),
              ListView(
                children: [
                  // Conteúdo da segunda aba
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
