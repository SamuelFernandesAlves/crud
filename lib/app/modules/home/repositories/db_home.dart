import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/usuario.dart';

class ConexaoFirebaseHome {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  ///Recupera dados User
  Future recuperarDadosUsuario() async {
    User? user = auth.currentUser;
    UsuarioModel usuario = UsuarioModel();
    DocumentSnapshot snapshot =
        await db.collection("usuariosCrud").doc(user?.uid).get();
    usuario = UsuarioModel.fromMap(snapshot.data() as Map<String, dynamic>);
    return usuario;
  }

  ///Check user Current
  bool checkCurrentUser() {
    User? user = auth.currentUser;
    return user != null ? true : false;
  }

  ///Deslogar User
  Future<bool> deslogarUsuario() async {
    await auth.signOut();
    bool verificarUsuarioDeslogado = checkCurrentUser();
    if (verificarUsuarioDeslogado) return false;
    return true;
  }

  ///Alerar Foto de Perfil
  Future alterarFoto(String url, UsuarioModel user) async {
    db.collection("usuariosCrud").doc(auth.currentUser!.uid).update({
      'foto': url,
    });
  }

  ///Atualizar dados
  Future atualizarDados(UsuarioModel user) async {
    db
        .collection("usuariosCrud")
        .doc(auth.currentUser!.uid)
        .update(user.toMap());
  }

  ///Atualizar e-mail no Firestore
  Future atualizarEmail(String email) async {
    await auth.currentUser!.updateEmail(email);
  }

  ///Atualizar e-mail auth
  Future atualizarEmailAuth(String email) async {
    try {
      await db.collection("usuariosCrud").doc(auth.currentUser!.uid).update({
        "e-mail": email,
      });


      return true;
    } catch (error) {
      print("Erro ao mudar e-mail");
    }
  }
}
