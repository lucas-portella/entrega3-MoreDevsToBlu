import 'nota.dart';
import 'notaProva.dart';
import 'notaTrabalho.dart';

class Aluno {
  String _nome;
  List<Nota> _notas = [];

  Aluno(this._nome);

  String getNome() {
    return _nome;
  }

  double media() {
    double somaNotas = 0, somaPesos = 0;

    if (_notas.isEmpty) return 0;

    for (var nota in _notas) {
      somaNotas += nota.getValor() * nota.getPeso();
      somaPesos += nota.getPeso();
    }

    return somaNotas / somaPesos;
  }

  void lancarNotaProva(double valor, String descricao) {
    _notas.add(NotaProva(valor, descricao));
  }

  void lancarNotaTrabalho(double valor, String descricao) {
    _notas.add(NotaTrabalho(valor, descricao));
  }

  double somaTrabalhos() {
    double somaNotas = 0;
    for (var nota in _notas) {
      if (nota is NotaTrabalho) somaNotas += nota.getValor();
    }

    return somaNotas;
  }

  double somaProvas() {
    double somaNotas = 0;

    for (var nota in _notas) {
      if (nota is NotaProva) somaNotas += nota.getValor();
    }

    return somaNotas;
  }

  void imprimeNotas() {
    for (var nota in _notas) {
      print(
        '${nota.getDescricao()} | ${nota.getTipo()} | ${nota.getValor()} | ${nota.getPeso()}',
      );
    }
  }

  void imprimeMedia() {
    print('Aluno: ${_nome}');
    print('Nota provas: ${somaProvas()}');
    print('Nota trabalhos: ${somaTrabalhos()}');
    print('Média: ${media()}\n');
  }
}
