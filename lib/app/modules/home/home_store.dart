import 'dart:io';

import 'package:crud/app/modules/home/repositories/db_home.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import '../model/usuario.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  ///Instacia do Storage(Aramazenamento de arquivos: fotos, videos...)
  FirebaseStorage storage = FirebaseStorage.instance;

  ///Instancia do Auth( Sistema de Login do Firebase )
  FirebaseAuth auth = FirebaseAuth.instance;

  ///Instancia do db( Arquivo onde é feita a manipulação de dados no banco )
  ConexaoFirebaseHome dbHome = ConexaoFirebaseHome();

  ///Model de Usuario
  @observable
  UsuarioModel usuario = UsuarioModel();

  ///Bool para mostrar load enquanto os dados são recuperados
  @observable
  bool loadDados = false;

  ///Recuperar Dados do Usuario Logado
  @action
  recuperarDadosUser() async {
    loadDados = false;
    usuario = await dbHome.recuperarDadosUsuario();
    nomeController.text = usuario.nome;
    emailController.text = usuario.email;
    cpfController.text = usuario.cpf;
    telefoneController.text = usuario.telefone;
    dropDownSexo = usuario.sexo;
    dropDownEstadoCivil = usuario.estadoCivil;
    loadDados = true;
  }

  ///Bool para verificar se o e-mail foi editado
  @observable
  bool boolTrocarEmail = false;

  ///String de mensagem denpendendo se o e-mail foi alterado com sucesso ou não
  @observable
  String textTrocarEmail = "";

  ///Bool para habilitar a edição de dados
  @observable
  bool openEdit = false;

  ///Ação para habilidar a edição de dados
  @action
  editOpenAction() {
    openEdit = !openEdit;
  }

  ///Ação para atulizar os dados do usuario, de acordo com dados que tenham sido alterado.
  @action
  Future AtualizarDadosUser() async {
    loadDados = false;
    dynamic resultErrorEmail = false;
    usuario.nome = nomeController.text;
    usuario.telefone = telefoneController.text;
    dbHome.atualizarDados(usuario);
    ///Verificação para saber se o usurario mudou o e-mail
    if (emailController.text != usuario.email) {
      if (EmailValidator.validate(usuario.email)) {
        usuario.email = emailController.text;
        ///Caso tenha alterado atuliza primeiro no auth, caso deer certo atuliza no Firestore
        resultErrorEmail = await dbHome.atualizarEmailAuth(usuario.email);
        if (resultErrorEmail != true) {
          boolTrocarEmail = true;
          textTrocarEmail =
              "Alerta!!!  \nErro ao alterar e-mail!\nRefaça o login e tente novamente.";
        } else {
          ///Atualizando email no Firestore
          boolTrocarEmail = false;
          await dbHome.atualizarEmail(usuario.email);
          textTrocarEmail = "";
        }
      }
    }
    loadDados = true;
  }

  @action
  DeslogarUser() async {
    bool response = await dbHome.deslogarUsuario();
    if (response) Modular.to.navigate('/');
  }

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
  ///observable para estado civil
  @observable
  String dropDownEstadoCivil = "Solteiro(a)";

  ///observable para Sexo
  @observable
  String dropDownSexo = "Masculino";

  ///Observable para mudar foto
  @observable
  String url = "";
  @observable
  bool loading = true;
  @observable
  bool uploading = false;
  @observable
  double total = 0;

  ///Ação para buscar a foto na galeria do celular
  @action
  Future<XFile?> getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }
  ///Ação para realizar o upload no storage
  @action
  Future<UploadTask> upload(String path) async {
    File file = File(path);
    try {
      //identificador unico colocar o id do user
      String ref = 'userCrud/images/' + auth.currentUser!.uid + '.jpg';
      return storage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload: ${e.code}');
    }
  }
  ///Ação que junta as duas funções acima e gera o link da imagem para exibição
  @action
  pickAndUploadImage() async {
    XFile? file = await getImage();
    if (file != null) {
      UploadTask task = await upload(file.path);
      task.snapshotEvents.listen((TaskSnapshot snapshot) async {
        if (snapshot.state == TaskState.running) {
          uploading = true;
          total = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
        } else if (snapshot.state == TaskState.success) {
          url = await snapshot.ref.getDownloadURL();
          //print("Aquivios:" + url);
          await alterarFotoPerfil(url);
        }
      });
    }
  }
  ///Ação para enviar a url da imgaem para o doc do user.
  @action
  alterarFotoPerfil(String url) async {
    await dbHome.alterarFoto(url, usuario);
    await recuperarDadosUser();
    uploading = false;
  }
}
