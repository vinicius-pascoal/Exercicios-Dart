// Vinicius Pascoal
import 'dart:io';

void main() {
  print('Digite os elementos do primeiro vetor (separados por espaço):');
  List<int> vetor1 = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  print('Digite os elementos do segundo vetor (separados por espaço):');
  List<int> vetor2 = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  List<int> vetor3 = []
    ..addAll(vetor1)
    ..addAll(vetor2);
  vetor3.sort();

  print('Vetor 3: $vetor3');
}
