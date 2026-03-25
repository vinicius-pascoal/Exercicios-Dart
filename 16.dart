// Vinicius Pascoal

import 'dart:io';

void main() {
  List<List<int>> vetores = [];
  for (int i = 0; i < 4; i++) {
    print('Digite os elementos do vetor ${i + 1} (separados por espaço):');
    List<int> vetor = stdin.readLineSync()!.split(' ').map(int.parse).toList();
    vetores.add(vetor);
  }

  List<int> vetor5 = []
    ..addAll(vetores[0])
    ..addAll(vetores[1])
    ..addAll(vetores[2])
    ..addAll(vetores[3]);
  vetor5.sort();

  Set<int> intersecao = vetores[0].toSet();
  for (int i = 1; i < vetores.length; i++) {
    intersecao = intersecao.intersection(vetores[i].toSet());
  }
  List<int> vetorIntersecao = intersecao.toList();

  print('Vetor 5 (ordenado): $vetor5');
  print('Vetor de interseção: $vetorIntersecao');
}
