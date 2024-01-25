import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/categoria/categoria_module.dart';
import 'package:flutter_modular_example/app/produto/produto_module.dart';
import 'package:flutter_modular_example/app/splash/splash_page.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const SplashPage());
    r.module('/categoria', module: CategoriaModule());
    r.module('/produto', module: ProdutoModule());
    super.routes(r);
  }
}
