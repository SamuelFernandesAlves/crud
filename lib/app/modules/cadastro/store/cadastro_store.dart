import 'package:crud/app/modules/cadastro/repositories/db_cadastro.dart';
import 'package:crud/app/modules/model/usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'cadastro_store.g.dart';

class CadastroStore = _CadastroStoreBase with _$CadastroStore;

abstract class _CadastroStoreBase with Store {
  final FirebaseStorage storage = FirebaseStorage.instance;

  FirebaseAuth auth = FirebaseAuth.instance;
  ConexaoFirebaseCadastro dbCadastro = ConexaoFirebaseCadastro();

  @observable
  UsuarioModel usuario = UsuarioModel();

  ///Controllers para textos
  @observable
  TextEditingController nomeController = TextEditingController();
  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController cpfController = TextEditingController();
  @observable
  TextEditingController telefoneController = TextEditingController();
  @observable
  TextEditingController senhaController = TextEditingController();
  @observable
  //observable para estado civil
  @observable
  String dropDownEstadoCivil = "Solteiro(a)";

  //observable para Sexo
  @observable
  String dropDownSexo = "Masculino";

  @observable
  bool result = false;

  @observable
  String textResult = '';

  //observable para imagem

  /////////////////////////////////////////
  @action
  CadastrarUser() async {
    dynamic resultCadastro = false;
    usuario.nome = nomeController.text;
    usuario.email = emailController.text;
    usuario.senha = senhaController.text;
    usuario.cpf = cpfController.text;
    usuario.telefone = telefoneController.text;
    usuario.estadoCivil = dropDownEstadoCivil;
    usuario.sexo = dropDownSexo;

    resultCadastro = await dbCadastro.CadastraUsuario(usuario);
    if (resultCadastro != true) {
      print("----------Error ao criar User");
      result = false;
      textResult =
          "Alerta!!!\n\nErro ao realizar cadastro, verifique os dados e tente novamente!\n";
    } else {
      print("novo usuario criado com sucesso:" + usuario.email.toString());
      print("---------Sucesso");
      result = true;
      textResult = "";
    }
  }
}
