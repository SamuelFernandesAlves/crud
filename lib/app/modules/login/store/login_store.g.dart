// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$usuarioAtom = Atom(name: '_LoginStoreBase.usuario');

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

  final _$emailControllerAtom = Atom(name: '_LoginStoreBase.emailController');

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

  final _$senhaControllerAtom = Atom(name: '_LoginStoreBase.senhaController');

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

  final _$resultAtom = Atom(name: '_LoginStoreBase.result');

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

  final _$textResultAtom = Atom(name: '_LoginStoreBase.textResult');

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

  final _$RealizarLoginAsyncAction =
      AsyncAction('_LoginStoreBase.RealizarLogin');

  @override
  Future<dynamic> RealizarLogin() {
    return _$RealizarLoginAsyncAction.run(() => super.RealizarLogin());
  }

  final _$VerificarUserLogadoAsyncAction =
      AsyncAction('_LoginStoreBase.VerificarUserLogado');

  @override
  Future<dynamic> VerificarUserLogado() {
    return _$VerificarUserLogadoAsyncAction
        .run(() => super.VerificarUserLogado());
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
emailController: ${emailController},
senhaController: ${senhaController},
result: ${result},
textResult: ${textResult}
    ''';
  }
}
