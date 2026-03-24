// Vinicius Pascoal

import 'dart:io';
import 'dart:math';

void main() {
  List<String> palavras = [
    'dart',
    'flutter',
    'programacao',
    'desenvolvimento',
    'mobile',
    'aplicativo',
    'tecnologia',
    'software',
    'hardware',
    'computador',
  ];
  String palavraSecreta = palavras[Random().nextInt(palavras.length)];
  List<String> letrasAdivinhadas = [];
  int tentativasRestantes = 6;

  while (tentativasRestantes > 0) {
    print(
      'Palavra: ${palavraSecreta.split('').map((letra) => letrasAdivinhadas.contains(letra) ? letra : '_').join(' ')}',
    );
    print('Tentativas restantes: $tentativasRestantes');
    print('Digite uma letra:');
    String letra = stdin.readLineSync()!.toLowerCase();

    if (palavraSecreta.contains(letra)) {
      letrasAdivinhadas.add(letra);
      if (palavraSecreta
          .split('')
          .every((letra) => letrasAdivinhadas.contains(letra))) {
        print('Correto a palavra era : $palavraSecreta');
        return;
      }
    } else {
      tentativasRestantes--;
      print('Letra incorreta!');
    }
  }

  print('Game Over! A palavra era: $palavraSecreta');
}
