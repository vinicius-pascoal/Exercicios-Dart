//Tayss Passos
import 'dart:io';

void main(List<String> args) {
  print(
    "--Levantamento sobre o perfil dos candidatos a vagas na empresa Ficticia--",
  );

  double idadesMExperientes = 0;
  int candidatosMExperientes = 0;
  int candidatosM = 0;
  int candidatosF = 0;
  int candidatos45mais = 0;
  int mulheres30MenosExperiente = 0;
  String candidataMaisJovemExperiente = "";
  int candidataMaisJovemIdade = 100;
  double idadeMediaHomensExperientes = 0;
  double porcentagemHomens45mais = 0;

  while (true) {
    stdout.write("Insira o nome do candidato: ");
    String? nome = stdin.readLineSync()!;
    if (nome.toUpperCase() == "FIM") {
      break;
    }

    stdout.write("Insira o sexo do candidato (F ou M): ");
    String? sexo = stdin.readLineSync()!;
    sexo = sexo.toUpperCase();

    stdout.write("Insira a idade do candidato: ");
    int? idade = int.parse(stdin.readLineSync()!);

    stdout.write("Informe se o candidato tem experiência com 'SIM' ou 'NAO': ");
    String? temExperiencia = stdin.readLineSync()!.toUpperCase();

    if (sexo == 'F') {
      candidatosF++;
      if (idade < 30 && temExperiencia == 'SIM') {
        mulheres30MenosExperiente++;
      }
      if (idade < candidataMaisJovemIdade && temExperiencia == 'SIM') {
        candidataMaisJovemIdade = idade;
        candidataMaisJovemExperiente = nome;
      }
    } else if (sexo == 'M') {
      candidatosM++;
      if (temExperiencia == 'SIM') {
        idadesMExperientes += idade;
        candidatosMExperientes++;
      }
      if (idade > 45) {
        candidatos45mais++;
      }
    }
  }

  if (candidatosMExperientes > 0) {
    idadeMediaHomensExperientes = (idadesMExperientes / candidatosMExperientes);
  }

  if (candidatosM > 0) {
    porcentagemHomens45mais = (candidatos45mais / candidatosM) * 100;
  }

  print(
    "O número de candidatos do sexo feminino é: $candidatosF\nO número de candidatos do sexo masculino é: $candidatosM.",
  );
  print(
    "A idade média dos homens que já tem experiência no serviço é: ${idadeMediaHomensExperientes.toStringAsFixed(2)}.",
  );
  print(
    "A porcentagem dos homens com mais de 45 anos com relação ao total de homens é de ${porcentagemHomens45mais.toStringAsFixed(2)}%.",
  );
  print(
    "O número de mulheres com idade inferior a 30 anos e com experiência no serviço é: $mulheres30MenosExperiente",
  );
  if (candidataMaisJovemExperiente == "") {
    print("Nenhuma candidata com experiência foi cadastrada.");
  } else {
    print(
      "O nome da candidata com a menor idade que já tem experiência no serviço é: $candidataMaisJovemExperiente",
    );
  }
}
