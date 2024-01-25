import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/produto/produto2_page.dart';
import 'package:flutter_modular_example/app/produto/produto_page.dart';

class ProdutoModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/:nome/xyz',
      child: (context) => ProdutoPage(
        nome: r.args.params['nome'],
      ),
    );

    r.child(
      '/xyz',
      child: (context) => Produto2Page(
        nome: r.args.queryParams['nome'],
      ),
    );
    super.routes(r);
  }
}
