//Tayssa Passos
import 'dart:io';

void main(List<String> args) {
  var alunos = <Map<String, dynamic>>[];
  double mediaTurma = 0.0;
  double mediaFem = 0.0;
  double percentualAprovados = 0.0;
  String maiorMediaM = "00000";
  String maiorMediaF = "00000";
  double maiorMediaValorM = -1;
  double maiorMediaValorF = -1;
  String situacao = "";
  double totalMedias = 0.0;
  int alunosAprovados = 0;
  int sexoFeminino = 0;
  double totalMediasFem = 0.0;

  print(
    "Para cada aluno insira a matrícula, nome, sexo ('M’ e 'F'), três notas e o número de faltas\n Inserir 00000 na matricula encerra o programa.",
  );
  while (true) {
    stdout.write("Insira a matrícula do aluno (12345): ");
    String? matricula = stdin.readLineSync()!;
    if (matricula == '00000') {
      break;
    } else {
      stdout.write("Insira o nome do aluno: ");
      String? nome = stdin.readLineSync()!;

      stdout.write("Insira o sexo do aluno (F ou M): ");
      String? sexo = stdin.readLineSync()!;
      sexo = sexo.toUpperCase();

      List<double> notasAlunoX = [];
      for (int j = 0; j < 3; j++) {
        stdout.write("Nota ${j + 1}: ");
        notasAlunoX.add(double.parse(stdin.readLineSync()!));
      }
      double media = notasAlunoX.reduce((a, b) => a + b) / 3;
      totalMedias += media;
      if (sexo == "F") {
        sexoFeminino += 1;
        totalMediasFem += media;
      }

      stdout.write("Insira a quantidade de faltas do aluno: ");
      int faltas = int.parse(stdin.readLineSync()!);

      if (media >= 7 && faltas <= 18) {
        situacao = "Aprovado";
        alunosAprovados++;
        if (sexo == "M" && media > maiorMediaValorM) {
          maiorMediaValorM = media;
          maiorMediaM = matricula;
        } else if (sexo == "F" && media > maiorMediaValorF) {
          maiorMediaValorF = media;
          maiorMediaF = matricula;
        }
      } else {
        situacao = "Reprovado";
      }

      alunos.add({
        "matricula": matricula,
        "nome": nome,
        "sexo": sexo,
        "notas": notasAlunoX,
        "faltas": faltas,
        "media": media,
        "situacao": situacao,
      });
    }
  }

  if (alunos.isNotEmpty) {
    mediaTurma = totalMedias / alunos.length;
    percentualAprovados = (alunosAprovados / alunos.length) * 100;
  } else {
    print("Nenhum aluno cadastrado.");
    return;
  }

  if (sexoFeminino > 0) {
    mediaFem = totalMediasFem / sexoFeminino;
  } else {
    mediaFem = 0;
  }

  print("A média da turma é: ${mediaTurma.toStringAsFixed(2)}");
  print(
    "O percentual de alunos aprovados é: ${percentualAprovados.toStringAsFixed(2)}%",
  );

  if (maiorMediaValorM == -1) {
    print("Nenhum aluno do sexo masculino aprovado.");
  } else {
    print("Matrícula do aluno do sexo masculino com maior média: $maiorMediaM");
  }
  if (maiorMediaValorF == -1) {
    print("Nenhum aluno do sexo feminino aprovado.");
  } else {
    print("Matrícula do aluno do sexo feminino com maior média: $maiorMediaF");
  }

  print("A média das alunas é: ${mediaFem.toStringAsFixed(2)}");
}
