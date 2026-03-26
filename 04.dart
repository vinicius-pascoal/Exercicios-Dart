//Tayssa Passos
import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  var alunos = <Map<String, dynamic>>[];
  double mediaTurma = 0.0;

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

      List<double> notasAlunoX = [];
      for (int j = 0; j < 3; j++) {
        stdout.write("Nota ${j + 1}: ");
        notasAlunoX.add(double.parse(stdin.readLineSync()!));
      }

      stdout.write("Insira a quantidade de faltas do aluno: ");
      int faltas = int.parse(stdin.readLineSync()!);

      alunos.add({
        "matricula": matricula,
        "nome": nome,
        "sexo": sexo,
        "notas": notasAlunoX,
        "faltas": faltas,
      });
    }
  }

  print(alunos);
}
