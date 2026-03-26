// Vinicius Pascoal

void main() {
  List<int> numeros = [1, 2, 2, 3, 4, 1, 4, 4, 5];
  Map<int, int> contagem = {};
  for (int numero in numeros) {
    if (contagem.containsKey(numero)) {
      contagem[numero] = contagem[numero]! + 1;
    } else {
      contagem[numero] = 1;
    }
  }
  print('Número - Quantidade');
  contagem.forEach((numero, quantidade) {
    print('$numero - $quantidade');
  });
}
