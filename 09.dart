// Marcelo Gomes
import "dart:math";

Future<void> main() async {
  for (int i = 1000; i <= 9999; i++) {
    if (pow(
          (int.parse(i.toString()[0] + i.toString()[1]) +
              int.parse(i.toString()[2] + i.toString()[3])),
          2,
        ) ==
        i) {
      print("$i tem a característica!");
    }
  }
}
