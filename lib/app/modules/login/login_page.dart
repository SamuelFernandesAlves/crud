import 'package:crud/app/modules/cadastro/cadastro_module.dart';
import 'package:crud/app/modules/cadastro/cadastro_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:crud/app/modules/login/store/login_store.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  final LoginStore store = Modular.get();
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();

///Init state para ver se possui usuario logado
  @override
  void initState() {
    store.VerificarUserLogado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Colors.purple,
              Colors.blueAccent,
            ])),
        padding: const EdgeInsets.all(12),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _FormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Realize seu login!",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      {
                        if (!EmailValidator.validate(
                            store.emailController.text)) {
                          return "O e-mail digitado não é valido";
                        }
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                    controller: store.emailController,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Insira seu e-mail",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17))),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    validator: (value) {
                      {
                        if (store.senhaController.text.length <= 6) {
                          return "Digite uma senha com pelo menos 6 caracteres";
                        }
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                    controller: store.senhaController,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Insira sua senha",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17))),
                  ),
                  const SizedBox(height: 20),
                  Observer(builder: (_)=>  store.result != true
                      ? Text(
                    store.textResult,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  )
                      : const SizedBox(),),
                  GestureDetector(
                    onTap: () async {
                      if (!_FormKey.currentState!.validate()) {
                        return;
                      } else {
                        await store.RealizarLogin();
                        if(store.result == true){
                          Modular.to.navigate('/home/');
                        }
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.orange,
                                Colors.red,
                              ])),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                          child: Text(
                        "Entrar",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      )),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => Modular.to.navigate('/cadastro/'),
                    child: const Center(
                        child: Text(
                      "Cadastre-se agora",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
