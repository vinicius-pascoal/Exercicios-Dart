// Willijefferson Alves

import 'dart:io';

void main() {
  String codigo, nome, sexo;
  double horasAula, salarioBruto, salarioLiquido;
  double totalSalarioHomens = 0.0, totalSalarioMulheres = 0.0;
  int totalHomens = 0, totalMulheres = 0;

  print("Digite o código do professor (ou '9999' para encerrar):");
  codigo = stdin.readLineSync()!;

  while (codigo != '9999') {
    print("Digite o nome do professor:");
    nome = stdin.readLineSync()!;

    print("Digite o sexo do professor (M para masculino, F para feminino):");
    sexo = stdin.readLineSync()!;

    print("Digite o número de horas de aula dadas no mês:");
    horasAula = double.tryParse(stdin.readLineSync()!) ?? 0.0;

    salarioBruto = horasAula * 12.30;

    if (sexo == 'M') {
      salarioLiquido = salarioBruto - (salarioBruto * 0.10);
      totalSalarioHomens += salarioLiquido;
      totalHomens++;
    } else if (sexo == 'F') {
      salarioLiquido = salarioBruto - (salarioBruto * 0.05);
      totalSalarioMulheres += salarioLiquido;
      totalMulheres++;
    } else {
      print("Sexo inválido. Use 'M' para masculino e 'F' para feminino.");
      continue;
    }

    print("\nCódigo: $codigo");
    print("Nome: $nome");
    print("Salário Bruto: R\$ $salarioBruto");
    print("Salário Líquido: R\$ $salarioLiquido");

    print("\nDigite o código do próximo professor (ou '9999' para encerrar):");
    codigo = stdin.readLineSync()!;
  }

  if (totalHomens > 0) {
    double mediaSalarioHomens = totalSalarioHomens / totalHomens;
    print(
      "\nMédia de salários líquidos dos professores masculinos: R\$ $mediaSalarioHomens",
    );
  } else {
    print("\nNão há professores masculinos na listagem.");
  }

  if (totalMulheres > 0) {
    double mediaSalarioMulheres = totalSalarioMulheres / totalMulheres;
    print(
      "Média de salários líquidos das professoras femininas: R\$ $mediaSalarioMulheres",
    );
  } else {
    print("Não há professoras femininas cadastradas.");
  }
}
