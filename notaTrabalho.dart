import 'nota.dart';

class NotaTrabalho extends Nota {
  double peso = 1;
  String tipo = 'Trabalho';
  NotaTrabalho(super._valor, super._descricao);

  @override
  double getPeso() {
    return peso;
  }

  @override
  String getTipo() {
    return tipo;
  }
}
