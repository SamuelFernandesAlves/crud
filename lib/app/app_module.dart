import 'package:crud/app/modules/cadastro/cadastro_module.dart';
import 'package:crud/app/modules/home/home_store.dart';
import 'package:crud/app/modules/login/login_module.dart';
import 'package:crud/app/modules/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/cadastro/store/cadastro_store.dart';
import 'modules/home/modulo/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
   Bind.lazySingleton((i) => LoginPageState()),
   Bind.lazySingleton((i) => CadastroStore()),
   Bind.lazySingleton((i) => HomeStore()),


  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: LoginModule()),
    ModuleRoute('/cadastro', module: CadastroModule()),
    ModuleRoute('/home', module: HomeModule())
  ];

}