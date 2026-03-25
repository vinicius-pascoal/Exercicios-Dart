//Vinicius Pascoal

import 'dart:io';

void printTabuleiro(List<List<String>> tabuleiro) {
  for (var linha in tabuleiro) {
    print(linha.join(' | '));
    print('---------');
  }
}

bool verificarVitoria(List<List<String>> tabuleiro, String jogador) {
  for (var linha in tabuleiro) {
    if (linha.every((celula) => celula == jogador)) {
      return true;
    }
  }

  for (int i = 0; i < 3; i++) {
    if (tabuleiro[0][i] == jogador &&
        tabuleiro[1][i] == jogador &&
        tabuleiro[2][i] == jogador) {
      return true;
    }
  }

  if (tabuleiro[0][0] == jogador &&
      tabuleiro[1][1] == jogador &&
      tabuleiro[2][2] == jogador) {
    return true;
  }
  if (tabuleiro[0][2] == jogador &&
      tabuleiro[1][1] == jogador &&
      tabuleiro[2][0] == jogador) {
    return true;
  }

  return false;
}

void main() {
  List<List<String>> tabuleiro = [
    [' ', ' ', ' '],
    [' ', ' ', ' '],
    [' ', ' ', ' '],
  ];
  String jogadorAtual = 'X';
  int jogadas = 0;

  while (true) {
    printTabuleiro(tabuleiro);
    print(
      'Jogador $jogadorAtual digite sua jogada (linha e coluna separados por espaço):',
    );
    List<String> entrada = stdin.readLineSync()!.split(' ');
    int linha = int.parse(entrada[0]) - 1;
    int coluna = int.parse(entrada[1]) - 1;

    if (tabuleiro[linha][coluna] == ' ') {
      tabuleiro[linha][coluna] = jogadorAtual;
      jogadas++;

      if (verificarVitoria(tabuleiro, jogadorAtual)) {
        printTabuleiro(tabuleiro);
        print('Jogador $jogadorAtual venceu!');
        break;
      } else if (jogadas == 9) {
        printTabuleiro(tabuleiro);
        print('Empate!');
        break;
      }

      jogadorAtual = jogadorAtual == 'X' ? 'O' : 'X';
    } else {
      print('Posição já ocupada. Tente novamente.');
    }
  }
}
