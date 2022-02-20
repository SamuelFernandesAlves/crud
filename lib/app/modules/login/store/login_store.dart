import 'package:crud/app/modules/login/repositories/db_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../model/usuario.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  ///Instancia do Auth( Sistema de Login do Firebase )
  FirebaseAuth auth = FirebaseAuth.instance;

  ///Instancia do db( Arquivo onde é feita a manipulação de dados no banco )
  ConexaoFirebaseLogin dblogin = ConexaoFirebaseLogin();

  ///Model de Usuario
  @observable
  UsuarioModel usuario = UsuarioModel();

  ///Controllers dos textos
  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController senhaController = TextEditingController();

  ///Bool para resultado do login, dependo mostra uma mensagem de erro
  @observable
  bool result = false;

  ///String para resultado do login, dependo mostra uma mensagem de erro
  @observable
  String textResult = '';

  ///Ação para realizar login
  @action
  Future RealizarLogin() async {
    dynamic resultLogin = false;
    usuario.email = emailController.text;
    usuario.senha = senhaController.text;
    resultLogin = await dblogin.logarUsuario(usuario);
    if (resultLogin != true) {
      textResult =
          "Alerta!!!\n\nErro ao realizar login, verifique os dados e tente novamente!\n";
      result = false;
    } else {
      textResult = "";
      result = true;
    }
  }

  ///Ação para buscar usuario logado, caso tenha o envia para home page
  @action
  Future VerificarUserLogado() async {
    User? user = auth.currentUser;
    if (user != null) {
      Modular.to.navigate('/home/');
    }
  }
}
