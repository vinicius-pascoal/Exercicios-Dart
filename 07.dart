// Mariana Penalva

import 'dart:io';

void main() {
  print("Insira o valor de X: ");
  int x = int.parse(stdin.readLineSync()!);

  print("Defina o número de termos: ");
  int n = int.parse(stdin.readLineSync()!);

  double soma = 0;

  for (int i = 1; i <= n; i++) {
    int termo = i % 5 == 0 ? factorial(x) : x;
    soma += termo;
    x++;

    if (i % 5 == 0) {
      x -= 8;
    }
  }

  print("Série = $soma");
}

int factorial(int n) {
  if (n <= 1) {
    return 1;
  }
  return n * factorial(n - 1);
}
