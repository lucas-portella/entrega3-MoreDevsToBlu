import 'nota.dart';

class NotaTrabalho extends Nota {
  double _peso = 1;
  String _tipo = 'Trabalho';
  NotaTrabalho(super._valor, super._descricao);

  @override
  double getPeso() {
    return _peso;
  }

  @override
  String getTipo() {
    return _tipo;
  }

  Map<String, dynamic> toMap () {
    return {
      'valor': getValor(),
      'descricao': getDescricao(),
      'tipo': _tipo,
      'peso': _peso
    };
  }

}
