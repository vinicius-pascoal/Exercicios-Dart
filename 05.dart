//Tayssa Passos
import 'dart:io';

void main(List<String> args) {
  var recemNacidos = <Map<String, dynamic>>[];
  String maiorPesoFem = "";
  double maiorPesoFemValor = -1;
  int baixoPeso = 0;
  int pesoNormal = 0;
  int altoPeso = 0;
  int totalCadastrados = 0;

  print(
    "Para cada recém-nascido insira: o nome, o sexo(F ou M) e o peso em kg.\nPara encerrar digite '000' no nome.",
  );

  while (true) {
    stdout.write("Insira o nome do recém-nascido: ");
    String? nome = stdin.readLineSync()!;
    if (nome == "000") {
      break;
    }

    stdout.write("Insira o sexo do recém-nascido (F ou M): ");
    String? sexo = stdin.readLineSync()!;
    sexo = sexo.toUpperCase();

    stdout.write("Insira o peso(kg) do recém-nascido: ");
    double? peso = double.parse(stdin.readLineSync()!);

    String classificacao = "";
    if (peso >= 0 && peso <= 2) {
      classificacao = "Baixo Peso";
      baixoPeso++;
    } else if (peso > 2 && peso <= 4) {
      classificacao = "Normal";
      pesoNormal++;
    } else {
      classificacao = "Alto Peso";
      altoPeso++;
    }

    if (sexo == "F" && peso > maiorPesoFemValor) {
      maiorPesoFemValor = peso;
      maiorPesoFem = nome;
    }

    recemNacidos.add({
      "nome": nome,
      "sexo": sexo,
      "peso": peso,
      "classificação": classificacao,
    });

    totalCadastrados++;
  }

  String percentualBaixoPeso = calcularPorcentagem(baixoPeso, totalCadastrados);
  String percentualAltoPeso = calcularPorcentagem(altoPeso, totalCadastrados);
  String percentualPesoNormal = calcularPorcentagem(
    pesoNormal,
    totalCadastrados,
  );

  for (var bebe in recemNacidos) {
    print("\n--- Recém-nascido ---");
    print("Nome: ${bebe["nome"]}");
    print("Sexo: ${bebe["sexo"]}");
    print("Classificação: ${bebe["classificação"]}");
  }
  if (maiorPesoFemValor == -1) {
    print("\nNenhuma recém-nascida cadastrada.");
  } else {
    print(
      "\nO nome do recém-nascido do sexo feminino com o maior peso é: $maiorPesoFem",
    );
  }
  print(
    "Percentual de recém-nascidos para cada classificação de peso:\n"
    "Baixo Peso: $percentualBaixoPeso\n"
    "Normal: $percentualPesoNormal\n"
    "Alto Peso: $percentualAltoPeso",
  );
}

String calcularPorcentagem(int parte, int total) {
  if (total <= 0) {
    return ("Não há bebes cadastrados.");
  } else {
    double resultado = (parte / total) * 100;
    return "${resultado.toStringAsFixed(2)}%";
  }
}
