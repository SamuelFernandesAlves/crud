import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/app/modules/model/usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConexaoFirebaseCadastro {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future CadastraUsuario(UsuarioModel user) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.senha);
      db
          .collection("usuariosCrud")
          .doc(auth.currentUser!.uid)
          .set(user.toMap());
      return true;
    } catch (error) {
      print("erro ao criar user" + error.toString());
    }
  }
}
