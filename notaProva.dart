import 'nota.dart';

class NotaProva extends Nota {
  double peso = 2;
  String tipo = 'Prova';

  NotaProva(double valor, String descricao) : super(valor, descricao);

  @override
  double getPeso() {
    return peso;
  }

  @override
  String getTipo() {
    return tipo;
  }
}
