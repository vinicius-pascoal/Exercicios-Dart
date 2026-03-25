// Vinicius Pascoal

import 'dart:io';

void main() {
  List<double> pesos = [];
  while (true) {
    print('Menu:');
    print('1. Cadastrar bois');
    print('2. Pesquisar bois por peso');
    print('3. Sair');
    String? escolha = stdin.readLineSync();

    if (escolha == '1') {
      print('Digite os pesos dos bois (separados por espaço):');
      String? entrada = stdin.readLineSync();
      if (entrada != null) {
        List<String> pesosStr = entrada.split(' ');
        for (String pesoStr in pesosStr) {
          double peso = double.parse(pesoStr);
          pesos.add(peso);
        }
        print('Bois cadastrados com sucesso!');
      }
    } else if (escolha == '2') {
      print('Digite o intervalo de peso (ex: 150 250):');
      String? intervalo = stdin.readLineSync();
      if (intervalo != null) {
        List<String> limites = intervalo.split(' ');
        double limiteInferior = double.parse(limites[0]);
        double limiteSuperior = double.parse(limites[1]);
        print('Bois com peso entre $limiteInferior e $limiteSuperior:');
        for (int i = 0; i < pesos.length; i++) {
          if (pesos[i] >= limiteInferior && pesos[i] <= limiteSuperior) {
            print('Boi ${i + 1}: ${pesos[i]}');
          }
        }
      }
    } else if (escolha == '3') {
      print('progama encerrado');
      break;
    } else {
      print('Opção inválida. Por favor, escolha novamente.');
    }
  }
}
