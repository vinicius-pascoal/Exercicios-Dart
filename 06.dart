// Vinicius Pascoal
import 'dart:io';
import 'dart:math';

void main() {
  int numeroAleatorio = Random().nextInt(100) + 1;
  int chute = 0;
  int limiteInferior = 1;
  int limiteSuperior = 100;

  print("o numero esta entre $limiteInferior e $limiteSuperior!");

  while (chute != numeroAleatorio) {
    print("Digite seu chute:");
    String? input = stdin.readLineSync();
    if (input != null) {
      chute = int.parse(input);

      if (chute < numeroAleatorio) {
        limiteInferior = chute + 1;
        print("O numero esta entre $limiteInferior e $limiteSuperior.");
      } else if (chute > numeroAleatorio) {
        limiteSuperior = chute - 1;
        print("O numero esta entre $limiteInferior e $limiteSuperior.");
      } else {
        print(" o número era $numeroAleatorio!");
      }
    }
  }
}
