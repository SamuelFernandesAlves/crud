import 'package:animate_do/animate_do.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_network/image_network.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();

  @override
  void initState() {
    store.recuperarDadosUser();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
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
          child: store.loadDados != true
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Center(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => store.DeslogarUser(),
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
                                "Home Page",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      store.editOpenAction();
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white10,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        height: 40,
                                        width: 40,
                                        child: const Icon(
                                          Icons.edit,
                                          size: 25,
                                          color: Colors.white,
                                        )),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  store.openEdit != false
                                      ? FadeInRight(
                                          duration: Duration(milliseconds: 180),
                                          child: GestureDetector(
                                            onTap: () async {
                                              store.AtualizarDadosUser();
                                              store.editOpenAction();
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white10,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                height: 40,
                                                width: 40,
                                                child: store.openEdit == false
                                                    ? const Icon(
                                                        Icons.edit,
                                                        size: 25,
                                                        color: Colors.white,
                                                      )
                                                    : const Icon(
                                                        Icons.save,
                                                        size: 25,
                                                        color: Colors.white,
                                                      )),
                                          ),
                                        )
                                      : SizedBox(),
                                ],
                              ),
                            ],
                          ),
                          Center(
                            child: Observer(
                              builder: (_) => Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  store.uploading
                                      ? CircleAvatar(
                                          radius: 70,
                                          child: Text(
                                            "${store.total.round()}% enviado",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ))
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(80),
                                          child: store.usuario.foto == ''
                                              ? const ImageNetwork(
                                                  image:
                                                      "https://i.pinimg.com/originals/8e/09/64/8e09645676f35f79514eaaff3bcdceb7.png",
                                                  imageCache:
                                                      CachedNetworkImageProvider(
                                                    "https://i.pinimg.com/originals/8e/09/64/8e09645676f35f79514eaaff3bcdceb7.png",
                                                  ),
                                                  height: 150,
                                                  width: 150,
                                                  fitWeb: BoxFitWeb.cover,
                                                  fitAndroidIos: BoxFit.cover,
                                                  onLoading:
                                                      CircularProgressIndicator(
                                                    color: Colors.blue,
                                                  ),
                                                  onError: Icon(Icons.error),
                                                )
                                              : ImageNetwork(
                                                  image: store.usuario.foto,
                                                  imageCache:
                                                      CachedNetworkImageProvider(
                                                          store.usuario.foto),
                                                  height: 150,
                                                  width: 150,
                                                  fitWeb: BoxFitWeb.cover,
                                                  fitAndroidIos: BoxFit.cover,
                                                  onLoading:
                                                      CircularProgressIndicator(
                                                    color: Colors.blue,
                                                  ),
                                                  onError: Icon(Icons.error),
                                                )),
                                  Positioned(
                                    bottom: -10.0,
                                    right: -10,
                                    child: store.uploading
                                        ? const CircularProgressIndicator(
                                            strokeWidth: 3,
                                            color: Colors.white,
                                          )
                                        : store.openEdit != true
                                            ? const SizedBox()
                                            : IconButton(
                                                icon: const Icon(
                                                  Icons.edit,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                                onPressed: () async {
                                                  await store
                                                      .pickAndUploadImage();
                                                },
                                              ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Observer(
                            builder: (_) => store.boolTrocarEmail != true
                                ? Text(
                                    store.textTrocarEmail,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                    ),
                                  )
                                : const SizedBox(),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Nome:",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          TextFormField(
                            enabled: store.openEdit,
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
                          const SizedBox(height: 10),
                          const Text(
                            "E-mail:",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          TextFormField(
                            enabled: store.openEdit,
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
                          const SizedBox(height: 10),
                          const Text(
                            "CPF:",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          TextFormField(
                            enabled: false,
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
                          const SizedBox(height: 10),
                          const Text(
                            "Telefone:",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          TextFormField(
                            enabled: store.openEdit,
                            validator: (value) {
                              {
                                if (store.telefoneController.text.length <=
                                    12) {
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
                              child: Text(
                                store.dropDownEstadoCivil,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
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
                              child: Text(
                                store.dropDownSexo,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
