import 'package:crud/app/modules/model/usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConexaoFirebaseLogin {
  FirebaseAuth auth = FirebaseAuth.instance;
///Future para realizar Login
  Future logarUsuario(UsuarioModel user) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: user.email, password: user.senha);
      return true;
    } catch (error) {
      print("Logar usuario: erro " + error.toString());
    }
  }
}
