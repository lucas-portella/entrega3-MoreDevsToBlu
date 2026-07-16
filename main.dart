import 'dart:io';
import 'turma.dart';

void main() {
  Turma turma = new Turma();
  String op;

  do {
    imprimeMenu();
    stdout.write('> ');
    op = stdin.readLineSync() ?? '';

    switch (op) {
      case '1':
        turma.cadastrarAluno();
      case '2':
        turma.listarAlunos();
      case '3':
        turma.listarNotasAlunos();
      case '4':
        turma.listarMediaAlunos();
      case '5':
        turma.lancarNotaAluno();
      case '6':
        print('Saindo..');

      default:
        print('Opção inválida.');
    }
  } while (op != '6');
}

void imprimeMenu() {
  print('Digite uma opção:');
  print(
    '1- Cadastrar aluno 2- Listar Alunos 3- Listar Notas Alunos 4- Listar Media Alunos 5- Cadastrar Nota Aluno 6- Sair',
  );
}
