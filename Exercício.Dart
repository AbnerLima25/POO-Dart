// Classe Endereco
class Endereco {
  String rua;
  String numero;
  String bairro;
  String cidade;
  String estado;
  String cep;

  Endereco(this.rua, this.numero, this.bairro, this.cidade, this.estado, this.cep);

  // Método para exibir o endereço completo
  void exibirEnderecoCompleto() {
    print('Endereço: $rua, $numero, $bairro, $cidade - $estado, CEP: $cep');
  }
}

// Classe Pessoa (Generalizada)
class Pessoa {
  String nome;
  String cpf;
  Endereco endereco;

  Pessoa(this.nome, this.cpf, this.endereco);

  // Método de cálculo de salário generalizado (Polimorfismo)
  double calcularSalario(double salarioBruto, int bonusPercentual, int descontoPercentual) {
    double bonus = salarioBruto * (bonusPercentual / 100);
    double desconto = salarioBruto * (descontoPercentual / 100);
    return (salarioBruto + bonus) - desconto;
  }
}

// Classe Funcionario (Herda de Pessoa)
class Funcionario extends Pessoa {
  double salarioBruto;
  int bonusPercentual;
  int descontoPercentual;

  Funcionario(String nome, String cpf, Endereco endereco, this.salarioBruto, this.bonusPercentual, this.descontoPercentual)
      : super(nome, cpf, endereco);

  // Sobrescreve o método para calcular salário e mostrar o demonstrativo (Polimorfismo)
  @override
  double calcularSalario(double salarioBruto, int bonusPercentual, int descontoPercentual) {
    double salarioLiquido = super.calcularSalario(salarioBruto, bonusPercentual, descontoPercentual);
    print('Demonstrativo do Funcionário:');
    print('Nome: $nome');
    print('CPF: $cpf');
    endereco.exibirEnderecoCompleto();
    print('Salário Bruto: R\$ ${salarioBruto.toStringAsFixed(2)}');
    print('Bônus: $bonusPercentual%');
    print('Desconto: $descontoPercentual%');
    print('Salário Líquido: R\$ ${salarioLiquido.toStringAsFixed(2)}');
    return salarioLiquido;
  }
}

// Classe Usuario
class Usuario {
  String dataCadastro;
  String ultimoLogin;
  String senha;

  Usuario(this.dataCadastro, this.ultimoLogin, this.senha);

  // Método Login
  bool login(String senhaDigitada) {
    if (senhaDigitada == senha) {
      print('Login realizado com sucesso.');
      return true;
    } else {
      print('Senha incorreta.');
      return false;
    }
  }

  // Método para atualizar dados do usuário
  void atualizarUsuario(String novaSenha, String novoLogin) {
    senha = novaSenha;
    ultimoLogin = novoLogin;
    print('Dados de usuário atualizados.');
  }
}

void main() {
  // Criação de um endereço
  Endereco enderecoFuncionario = Endereco('Rua das Flores', '123', 'Centro', 'São Paulo', 'SP', '01001-000');

  // Instanciando um Funcionario
  Funcionario funcionario = Funcionario('João Silva', '123.456.789-00', enderecoFuncionario, 1450.00, 15, 3);

  // Calculando salário e mostrando demonstrativo
  funcionario.calcularSalario(funcionario.salarioBruto, funcionario.bonusPercentual, funcionario.descontoPercentual);

  // Instanciando um Usuário
  Usuario usuario = Usuario('01/01/2023', '01/09/2024', 'senha123');

  // Testando o login
  usuario.login('senha123');

  // Atualizando dados do usuário
  usuario.atualizarUsuario('novaSenha123', '18/09/2024');
}