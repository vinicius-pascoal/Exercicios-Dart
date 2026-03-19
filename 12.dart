// Marcelo Gomes
import 'dart:io';

Future<void> main() async {
  print("Escolha um número:");
  String? numero = stdin.readLineSync();
  var lista = [];

  if (numero != null) {
    int.parse(numero);
    for (int i = numero.length; i > 0; i--) {
      lista.add(numero[i - 1]);
    }
  }
  print(lista.join());
}
