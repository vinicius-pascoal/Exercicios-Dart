//Tayssa Passos
import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  var N = 3;
  var D = 5;
  var E = 4;
  double S = 0;

  stdout.write("Favor inserir o número de termos: ");
  int termos = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < termos; i++) {
    double termo = (pow(N, fatorial(E)) / D);

    if (i % 2 == 0) {
      S += termo;
    } else {
      S -= termo;
    }

    N += 2;
    D += 5;
    E += 4;

    print("S = $S");
  }

  print("Resultado da série com $termos termos: $S");
}

int fatorial(int n) {
  if (n < 0) {
    throw ArgumentError("Não há fatorial pra números negativos.");
  }
  if (n == 0 || n == 1) {
    return 1;
  }
  return n * fatorial(n - 1);
}
