// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroStore on _CadastroStoreBase, Store {
  final _$usuarioAtom = Atom(name: '_CadastroStoreBase.usuario');

  @override
  UsuarioModel get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(UsuarioModel value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  final _$nomeControllerAtom = Atom(name: '_CadastroStoreBase.nomeController');

  @override
  TextEditingController get nomeController {
    _$nomeControllerAtom.reportRead();
    return super.nomeController;
  }

  @override
  set nomeController(TextEditingController value) {
    _$nomeControllerAtom.reportWrite(value, super.nomeController, () {
      super.nomeController = value;
    });
  }

  final _$emailControllerAtom =
      Atom(name: '_CadastroStoreBase.emailController');

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  final _$cpfControllerAtom = Atom(name: '_CadastroStoreBase.cpfController');

  @override
  TextEditingController get cpfController {
    _$cpfControllerAtom.reportRead();
    return super.cpfController;
  }

  @override
  set cpfController(TextEditingController value) {
    _$cpfControllerAtom.reportWrite(value, super.cpfController, () {
      super.cpfController = value;
    });
  }

  final _$telefoneControllerAtom =
      Atom(name: '_CadastroStoreBase.telefoneController');

  @override
  TextEditingController get telefoneController {
    _$telefoneControllerAtom.reportRead();
    return super.telefoneController;
  }

  @override
  set telefoneController(TextEditingController value) {
    _$telefoneControllerAtom.reportWrite(value, super.telefoneController, () {
      super.telefoneController = value;
    });
  }

  final _$senhaControllerAtom =
      Atom(name: '_CadastroStoreBase.senhaController');

  @override
  TextEditingController get senhaController {
    _$senhaControllerAtom.reportRead();
    return super.senhaController;
  }

  @override
  set senhaController(TextEditingController value) {
    _$senhaControllerAtom.reportWrite(value, super.senhaController, () {
      super.senhaController = value;
    });
  }

  final _$dropDownEstadoCivilAtom =
      Atom(name: '_CadastroStoreBase.dropDownEstadoCivil');

  @override
  String get dropDownEstadoCivil {
    _$dropDownEstadoCivilAtom.reportRead();
    return super.dropDownEstadoCivil;
  }

  @override
  set dropDownEstadoCivil(String value) {
    _$dropDownEstadoCivilAtom.reportWrite(value, super.dropDownEstadoCivil, () {
      super.dropDownEstadoCivil = value;
    });
  }

  final _$dropDownSexoAtom = Atom(name: '_CadastroStoreBase.dropDownSexo');

  @override
  String get dropDownSexo {
    _$dropDownSexoAtom.reportRead();
    return super.dropDownSexo;
  }

  @override
  set dropDownSexo(String value) {
    _$dropDownSexoAtom.reportWrite(value, super.dropDownSexo, () {
      super.dropDownSexo = value;
    });
  }

  final _$resultAtom = Atom(name: '_CadastroStoreBase.result');

  @override
  bool get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(bool value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  final _$textResultAtom = Atom(name: '_CadastroStoreBase.textResult');

  @override
  String get textResult {
    _$textResultAtom.reportRead();
    return super.textResult;
  }

  @override
  set textResult(String value) {
    _$textResultAtom.reportWrite(value, super.textResult, () {
      super.textResult = value;
    });
  }

  final _$CadastrarUserAsyncAction =
      AsyncAction('_CadastroStoreBase.CadastrarUser');

  @override
  Future CadastrarUser() {
    return _$CadastrarUserAsyncAction.run(() => super.CadastrarUser());
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
nomeController: ${nomeController},
emailController: ${emailController},
cpfController: ${cpfController},
telefoneController: ${telefoneController},
senhaController: ${senhaController},
dropDownEstadoCivil: ${dropDownEstadoCivil},
dropDownSexo: ${dropDownSexo},
result: ${result},
textResult: ${textResult}
    ''';
  }
}
