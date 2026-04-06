import 'dart:io';

void main() {
  final List<String> mapaBase = [
    "###########",
    "#E   #    #",
    "# # ### # #",
    "# #     # #",
    "# ##### # #",
    "#     # # #",
    "### # # # #",
    "#   #   #S#",
    "###########",
  ];

  List<List<String>> mapa = mapaBase.map((linha) => linha.split('')).toList();

  int jogadorLinha = 1;
  int jogadorColuna = 1;

  int saidaLinha = 7;
  int saidaColuna = 9;

  bool venceu = false;

  while (!venceu) {
    desenharMapa(mapa, jogadorLinha, jogadorColuna);
    stdout.writeln("Use W (cima), S (baixo), A (esquerda), D (direita)");
    stdout.write("Digite um comando: ");

    String? comando = stdin.readLineSync();

    if (comando == null || comando.isEmpty) {
      continue;
    }

    comando = comando.toLowerCase();

    int novaLinha = jogadorLinha;
    int novaColuna = jogadorColuna;

    if (comando == 'w') {
      novaLinha--;
    } else if (comando == 's') {
      novaLinha++;
    } else if (comando == 'a') {
      novaColuna--;
    } else if (comando == 'd') {
      novaColuna++;
    } else {
      stdout.writeln("Comando inválido.");
      continue;
    }

    if (mapa[novaLinha][novaColuna] != '#') {
      jogadorLinha = novaLinha;
      jogadorColuna = novaColuna;
    } else {
      stdout.writeln("Há uma parede nesse caminho.");
    }

    if (jogadorLinha == saidaLinha && jogadorColuna == saidaColuna) {
      desenharMapa(mapa, jogadorLinha, jogadorColuna);
      stdout.writeln("Parabéns! Você encontrou a saída do labirinto.");
      venceu = true;
    }
  }
}

void desenharMapa(
  List<List<String>> mapa,
  int jogadorLinha,
  int jogadorColuna,
) {
  stdout.write("\x1B[2J\x1B[0;0H");

  for (int i = 0; i < mapa.length; i++) {
    for (int j = 0; j < mapa[i].length; j++) {
      if (i == jogadorLinha && j == jogadorColuna) {
        stdout.write("@");
      } else {
        stdout.write(mapa[i][j]);
      }
    }
    stdout.writeln();
  }

  stdout.writeln();
  stdout.writeln("Legenda: E = entrada | S = saída | @ = jogador");
}
