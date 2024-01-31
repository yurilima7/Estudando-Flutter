import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/categoria/categoria_page.dart';
import 'package:flutter_modular_example/app/model/categoria_controller.dart';

class CategoriaModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    // i.addInstance(CategoriaController());
    i.addLazySingleton(CategoriaController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => CategoriaPage(categoria: r.args.data),
    );
    super.routes(r);
  }
}
