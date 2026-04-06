// Mariana Penalva

import 'dart:io';

void main() {
  List<String> codigosCCMais2500 = [];
  String nomeMenorPontuacaoMasculino = "";
  double menorPontuacaoMasculino = double.infinity;
  String codigoMaiorPontuacaoSI = "";
  double maiorPontuacaoSIMasculino = 0.0;
  int totalMasculino = 0;
  int totalFeminino = 0;

  while (true) {
    print("Digite o código do candidato (ou '0000' para encerrar):");
    String codigo = stdin.readLineSync()!;

    if (codigo == '0000') {
      break;
    }

    print(
      "Digite o curso (CC para Ciência da Computação ou SI para Sistemas de Informação):",
    );
    String curso = stdin.readLineSync()!;

    print("Digite o nome do candidato:");
    String nome = stdin.readLineSync()!;

    print("Digite o sexo (M/F):");
    String sexo = stdin.readLineSync()!;

    print("Digite a pontuação (0-5000):");
    double pontuacao = double.tryParse(stdin.readLineSync()!) ?? 0.0;

    if (curso == 'CC' && pontuacao > 2500) {
      codigosCCMais2500.add(
        "Código: $codigo, Nome: $nome, Pontuação: $pontuacao",
      );
    }

    if (sexo == 'M' && pontuacao < menorPontuacaoMasculino) {
      menorPontuacaoMasculino = pontuacao;
      nomeMenorPontuacaoMasculino = nome;
    }

    if (curso == 'SI' && sexo == 'M' && pontuacao > maiorPontuacaoSIMasculino) {
      maiorPontuacaoSIMasculino = pontuacao;
      codigoMaiorPontuacaoSI = codigo;
    }

    if (sexo == 'M') {
      totalMasculino++;
    } else if (sexo == 'F') {
      totalFeminino++;
    }
  }

  int total = totalMasculino + totalFeminino;

  double percentualMasculino = total > 0 ? (totalMasculino / total) * 100 : 0;
  double percentualFeminino = total > 0 ? (totalFeminino / total) * 100 : 0;

  print("\nDados Finais:");
  print("Candidatos de Ciência da Computação com mais de 2500 pontos:");
  for (String info in codigosCCMais2500) {
    print(info);
  }
  print(
    "Nome do candidato masculino com menor pontuação: $nomeMenorPontuacaoMasculino",
  );
  print(
    "Código do candidato masculino com maior pontuação em Sistemas de Informação: $codigoMaiorPontuacaoSI",
  );
  print(
    "Percentual de candidatos do sexo Masculino: ${percentualMasculino.toStringAsFixed(2)}%",
  );
  print(
    "Percentual de candidatos do sexo Feminino: ${percentualFeminino.toStringAsFixed(2)}%",
  );
}
