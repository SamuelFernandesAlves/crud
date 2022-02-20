import 'package:brasil_fields/brasil_fields.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:crud/app/modules/cadastro/store/cadastro_store.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class CadastroPage extends StatefulWidget {
  final String title;

  const CadastroPage({Key? key, this.title = 'CadastroPage'}) : super(key: key);

  @override
  CadastroPageState createState() => CadastroPageState();
}

class CadastroPageState extends State<CadastroPage> {
  final CadastroStore store = Modular.get();
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () => Modular.to.navigate('/'),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(12)),
                          height: 40,
                          width: 40,
                          child: const Icon(
                            Icons.arrow_back_ios_outlined,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Text(
                        "Realize seu cadastro!",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child:
                      const ImageNetwork(
                        image:
                        "https://i.pinimg.com/originals/8e/09/64/8e09645676f35f79514eaaff3bcdceb7.png",
                        imageCache: CachedNetworkImageProvider("https://i.pinimg.com/originals/8e/09/64/8e09645676f35f79514eaaff3bcdceb7.png"),
                        height: 120,
                        width: 120,
                        fitWeb: BoxFitWeb.cover,
                        fitAndroidIos: BoxFit.cover,
                        onLoading: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                        onError: Icon(Icons.error),
                      )
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      {
                        if (store.nomeController.text.length <= 3 &&
                            store.nomeController.text.length <= 25) {
                          return "Digite seu nome completo, com menos de 25 caracteres";
                        }
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                    controller: store.nomeController,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Insira seu Nome",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17))),
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
                        hintText: "Insira seu E-mail",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17))),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      {
                        if (store.cpfController.text.length <= 13) {
                          return "Digite seu CPF completo";
                        }
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                    controller: store.cpfController,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Insira seu CPF",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17))),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      {
                        if (store.telefoneController.text.length <= 12) {
                          return "Digite seu número completo";
                        }
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                    controller: store.telefoneController,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Insira seu Telefone",
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
                    keyboardType: TextInputType.text,
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
                  const SizedBox(height: 10),
                  const Text(
                    "Estado civil:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: Center(
                      child: DropdownButton<String>(
                        value: store.dropDownEstadoCivil.toString(),
                        icon: const Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 1,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            store.dropDownEstadoCivil = newValue!;
                          });
                        },
                        items: <String>[
                          'Solteiro(a)',
                          'Casado(a)',
                          'Separado(a)',
                          'Divorciado(a)',
                          'Viúvo(a)'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Center(
                              child: Text(
                                value,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Sexo",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: Center(
                      child: DropdownButton<String>(
                        value: store.dropDownSexo.toString(),
                        icon: const Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 1,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            store.dropDownSexo = newValue!;
                          });
                        },
                        items: <String>[
                          'Masculino',
                          'Feminino',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Center(
                              child: Text(
                                value,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Observer(
                    builder: (_) => store.result != true
                        ? Text(
                            store.textResult,
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          )
                        : const SizedBox(),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (!_FormKey.currentState!.validate()) {
                        return;
                      } else {
                        await store.CadastrarUser();
                        if (store.result == true) {
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
                        "Realizar Cadastro",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      )),
                    ),
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
