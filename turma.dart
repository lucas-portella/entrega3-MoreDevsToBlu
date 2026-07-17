import 'aluno.dart';
import 'dart:io';

class Turma {
  List<Aluno> _alunos = [];

  Turma();
  //
  void cadastrarAluno() {
    _alunos.add(Aluno(_lerNomeAluno()));
  }

  void _cadastrarAluno(Aluno aluno) {
    _alunos.add(aluno);
  }

  factory Turma.fromMap(Map<String, dynamic> map) {
    Turma turma = new Turma();
    for (var aluno in map['alunos'].toList())
      turma._cadastrarAluno(Aluno.fromMap(aluno));
    return turma;
  }

  bool indiceValido(int i) {
    return (i >= 0 && i < _alunos.length);
  }

  void listarAlunos() {
    if (_alunos.isEmpty) {
      print('Não tem alunos cadastrados.');
      return;
    }

    for (var i = 0; i < _alunos.length; i++) {
      print('${i} | ${_alunos[i].getNome()}');
    }
  }

  void listarNotasAlunos() {
    if (_alunos.isEmpty) {
      print('Não tem alunos cadastrados.');
      return;
    }

    for (var aluno in _alunos) aluno.imprimeNotas();
  }

  void listarMediaAlunos() {
    if (_alunos.isEmpty) {
      print('Não tem alunos cadastrados.');
      return;
    }

    for (var aluno in _alunos) aluno.imprimeMedia();
  }

  void _lancarNotaTrabalhoAluno(int indice, double valor, String descricao) {
    if (!indiceValido(indice)) return;

    _alunos[indice].lancarNotaTrabalho(valor, descricao);
  }

  void _lancarNotaProvaAluno(int indice, double valor, String descricao) {
    if (!indiceValido(indice)) return;

    _alunos[indice].lancarNotaProva(valor, descricao);
  }

  void lancarNotaAluno() {
    String opcao, descricao;
    double nota;
    int indiceAluno;

    if (_alunos.isEmpty) {
      print('Sem alunos cadastrados.');
      return;
    }

    listarAlunos();
    stdout.write('Digite o índice do aluno: ');
    indiceAluno = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

    if (!indiceValido(indiceAluno)) {
      print('Índice inválido. Abortando.');
      return;
    }

    stdout.write(
      'Digite 1 para lançar uma nota de prova e 2 para lançar uma nota de trabalho: ',
    );
    opcao = stdin.readLineSync() ?? '';

    if (opcao != '1' && opcao != '2') {
      print('Opção inválida. Abortando.');
      return;
    }

    nota = _lerNota();
    descricao = _lerDescricao();

    if (opcao == '1')
      _lancarNotaProvaAluno(indiceAluno, nota, descricao);
    else
      _lancarNotaTrabalhoAluno(indiceAluno, nota, descricao);
  }

  double _lerNota() {
    double nota;

    while (true) {
      stdout.write('Nota: ');
      nota = double.tryParse(stdin.readLineSync() ?? '') ?? -1;
      if (nota >= 0 && nota <= 10) return nota;
      print('Nota inválida. Digite uma nota entre 0 e 10.');
    }
  }

  String _lerDescricao() {
    String descricao;
    while (true) {
      stdout.write('Descrição: ');
      descricao = stdin.readLineSync() ?? '';
      if (descricao != '') return descricao;
      print('Descrição inválida. A descrição não pode ser vazia.');
    }
  }

  String _lerNomeAluno() {
    String nome;
    while (true) {
      stdout.write('Digite o nome do aluno: ');
      nome = stdin.readLineSync() ?? '';
      if (nome != '') return nome;
      print('Nome inválido. O nome não pode estar vazio');
    }
  }

  Map<String, dynamic> toMap() {
    return {'alunos': _alunos.map((aluno) => aluno.toMap()).toList()};
  }
}
