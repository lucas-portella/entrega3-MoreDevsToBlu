abstract class Nota {
  double _valor;
  String _descricao;

  Nota(this._valor, this._descricao);

  double getValor() {
    return _valor;
  }

  String getDescricao() {
    return _descricao;
  }

  double getPeso();
  String getTipo();
  Map <String, dynamic> toMap();

}
