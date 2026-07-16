import 'nota.dart';

class NotaProva extends Nota {
  double _peso = 2;
  String _tipo = 'Prova';

  NotaProva(double valor, String descricao) : super(valor, descricao);

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
