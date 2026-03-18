//vinicius Pascoal
void main() {
  List<int> S = [];
  int primeiro = 1;
  int sequencias = 10;
  for (int i = 1; i <= sequencias; i += 1) {
    S.add(primeiro);
    primeiro *= 2;
    S.add(i * 5);
    S.add(110 - i * 10);
  }
  print("S = $S");
}
