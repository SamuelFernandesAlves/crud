
///Model de user para relizar ações necessarias
class UsuarioModel {
  String nome;
  String email;
  String cpf;
  String telefone;
  String estadoCivil;
  String sexo;
  String foto;
  String senha;

  //List<String> esse;

  UsuarioModel(
      {this.nome = '',
      this.email = '',
      this.foto = '',
      this.cpf = '',
      this.estadoCivil = '',
      this.sexo = '',
      this.telefone = '',
      this.senha = ''
      //required this.esse,
      });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "nome": this.nome,
      "e-mail": this.email,
      "cpf": this.cpf,
      "telefone": this.telefone,
      "estadoCivil": this.estadoCivil,
      "sexo": this.sexo,
      "foto": this.foto,
    };
    return map;
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> dados) {
    return UsuarioModel(
      nome: dados["nome"],
      email: dados['e-mail'],
      cpf: dados['cpf'],
      telefone: dados['telefone'],
      estadoCivil: dados['estadoCivil'],
      sexo: dados['sexo'],
      foto: dados['foto'],
    );
  }

// factory UsuarioModel.newModel(){
//   return UsuarioModel(esse: []);
// }

}
