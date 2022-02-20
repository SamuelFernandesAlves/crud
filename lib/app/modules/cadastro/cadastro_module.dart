import 'package:crud/app/modules/cadastro/cadastro_Page.dart';
import 'package:crud/app/modules/cadastro/store/cadastro_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CadastroModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CadastroStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CadastroPage()),
  ];
}
