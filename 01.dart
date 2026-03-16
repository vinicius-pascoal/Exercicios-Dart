import 'dart:io';

void main() {
  const boloPrecos = {'ovos': 5.0, 'chocolate': 7.0, 'cenoura': 6.0};
  print("opções de bolo: ovos, chocolate, cenoura");
  var total = 0.0;
  while (true) {
    print("Digite o nome do bolo (ou 'sair' para encerrar):");
    String? bolo = stdin.readLineSync();
    if (bolo == 'sair') {
      break;
    }
    if (boloPrecos.containsKey(bolo)) {
      total += boloPrecos[bolo]!;
      print("bolo adicionado");
    } else {
      print("Desculpe, não temos o bolo de $bolo.");
    }
  }
  print("Total:$total");
}
