import 'dart:io';

void adicionar(Map<String, String> meusContatos) {
  //digitar nome que quer adicionar
  print("Digite o nome");
  final nome = stdin.readLineSync()!;

  //digitar o numero que quer adicionar
  print("Digite o numero");
  final numero = stdin.readLineSync()!;

  //verificar se ja existe na lista de contatos
  //se ja existe, dar mensagem de erro e acabar
  //se nao existe, adicionar e falar que deu certo
  if (meusContatos.containsKey(nome)) {
    print("Usuario ja existe. Seu numero eh ${meusContatos[nome]}");
  } else {
    meusContatos.addAll({nome: numero});
    print("Cadastro efetuado com sucesso!");
  }
}

void listarTodos(Map<String, String> meusContatos) {
  for (final entry in meusContatos.entries) {
    print("${entry.key}: ${entry.value}");
    print("*****************************");
  }

  //ou posso fazer com o for each:
  //meusContatos.forEach((key, value) {
  //  print("$key: $value");
  //  print("*****************************");
  // });
}

void atualizar(Map<String, String> meusContatos) {
  //o usuario digita o nome e numero
  print("Digite o nome do contato cujo numero voce deseja atualizar");
  final nome = stdin.readLineSync()!;
  //se o nome existir, atualiza o numero
  //se o nome nao existir, avisa que nao existe
  if (meusContatos.containsKey(nome)) {
    print("Entao digite o numero de novo");
    final numero = stdin.readLineSync()!;
    meusContatos.update(nome, (value) => numero);
    print("Contato atualizado com sucesso!");
  } else {
    print("Esse nome nao esta na lista de contato");
  }
}

void remover(Map<String, String> meusContatos) {
  //pegar o nome do contato a ser removido
  print("Digite o nome da pessoa que voce quer excluir da sua agenda");
  final nome = stdin.readLineSync()!;

  //verificar se existe
  //se existe, remove da lista
  //se nao existe, avisa que não existe
  if (meusContatos.containsKey(nome)) {
    meusContatos.removeWhere((key, value) => key == nome);
    print("Contato excluido");
  } else {
    print("Esse nome nao esta na agenda");
  }
}

void main() {
  Map<String, String> meusContatos = {'Pedro': '12345678'};
  const menu = '1 - Create\n2 - Read\n3 - Update\n4 - Delete\n5 - Sair';
  int opcaoDoUsuario;
  do {
    print(menu);
    print("Digite a opcao desejada");
    opcaoDoUsuario = int.parse(stdin.readLineSync()!);

    switch (opcaoDoUsuario) {
      case 1:
        adicionar(meusContatos);
      case 2:
        listarTodos(meusContatos);
      case 3:
        atualizar(meusContatos);
      case 4:
        remover(meusContatos);
      case 5:
        print("Ate logo!");
      default:
        print("Opcao invalida!");
    }
  } while (opcaoDoUsuario != 5);

  /*
  var pessoa2 = <String, Object>{'nome': 'Pedro', 'idade': 22};

  //metodo keys para capturar as chaves do mapa "pessoa2"
  final keys = pessoa2.keys;
  for (final key in keys) {
    print(key);
    print(pessoa2[key]);
  }

  //metodo values para capturar as chaves do mapa "pessoa2"
  final values = pessoa2.values;
  for (final value in values) {
    print(value);
  }
  //metodo entries para capturar as chaves do mapa "pessoa2"
  final entries = pessoa2.entries;
  for (final entry in entries) {
    print(entry);
    print(entry.key);
    print(entry.value);
  }
  */

  /*
  var pessoa = <String, dynamic>{'nome': 'Pedro', 'idade': 22};
  print(pessoa.runtimeType);
  var nome = pessoa['nome'] as String;
  */

  /*
  var pessoa = <String, dynamic>{'nome': 'Pedro', 'idade': 22};
  print(pessoa['nome']);
  print(pessoa.nome);
  */

  /*
  var pessoa = {'nome': 'Ana', 'idade': 22};
  print(pessoa['nome']);
  //print(pessoa.nome); //nao tem ponto para mapas
  */

  /*
  //type annotation
  var pessoa = <String, String>{};
  pessoa.addAll({'nome': 'Pedro', 'sobrenome': 'Silva'});
  print(pessoa);

  var lembretes = <int, String>{1: "Fazer compras", 2: 'ver um filme'};
  */

  /*
  var A = {1, 2, 3, 4, 5, 6};
  var B = {1, 3, 7};
  print(A.union(B)); // 1, 2, 3, 4, 5, 6, 7
  print(A.intersection(B)); // 1, 3
  print(A.difference(B)); // 2, 4, 5
  print(B.difference(A)); // 7
  print(A.difference(A)); // {} -> conjunto vazio
  */

  /*
  var nomes = {'Pedro', 'Joao'};
  print(nomes.elementAt(0));

  for (var nome in nomes) {
    print(nome);
  }

  for (var i = 0; i < nomes.length; i++) {
    print(nomes.elementAt(i));
  }
  */

  /*
  // [1, 2] != [2, 1] != [1, 2, 2]; na lista a ordem e repetição importa
  // {1, 2} = {2, 1} = {1, 2, 2} = {2, 2, 2, 2, 2, 1, 1, 2, 1, 2, 1} em conjunto a ordem e conjunto nao importa

  var nomes = {'Ana', 'Joao'};
  print(nomes);
  print(nomes.runtimeType);

  var paises = {'Brasil', 'Brasil'};
  print(paises);

  var oQueEhIsso =
      {}; // parece um conjunto por usar chaves, mas como ele nasce vazio é um mapa (mapa é uma coleção de pares, chaves e valor)
  print(oQueEhIsso.runtimeType);
  */

  /*
  var tupla =
      ('Ana', 19, true); //tupla é como se fosse uma lista, mas ela é imutável
  print(tupla);
  print(tupla.runtimeType); //uma tupla é construída em tempo de compilação
  */

  /*
  List<String?>? lista = []; //aqui a lista pode ser null e pode conter null;
  List<String>? eAgora = []; //aqui a lista só pode conter string, mas pode ser null
  List<String?> nomes3 = []; //aqui apesar de eu deixar a lista em branco e especificar que é uma string opcional, ela pode conter null, mas não pode ser null
  List<String> nomes4 = []; //aqui apesar de eu deixar a lista em branco, ela é uma string porque eu especifiquei isso ao cria-la
  */

  /*
  var nomes2 = []; //como nao coloquei nada na lista, ela automaticamente é dinamica, ou seja, aceita qualquer tipo de item
  print(nomes2.runtimeType);
  nomes2.add(null);
  nomes2.add(1);
  nomes2.add(true);
  */

  /*
  var nomes1 = ["Ana", "Pedro", null]; //se eu coloco null na coleção, automaticamente altero o tipo da lista para dinamica
  print(nomes1.runtimeType);
  nomes1.add(null);
  */

  /*
  //declaracao de colecoes com const (não permite qualquer tipo de motificação na variável de referência)
  const nomes = ["Ana", "Pedro"];
  nomes[0] = "Pedro"; //não funciona, porque const é imutável
  */

  /*
  //declaração de coleções com final (não permite que eu troque a variavel de referencia)
  final nomes = ['Ana', 'Pedro'];
  nomes[0] = "Ana Paula";
  nomes.add("Jaqueline");
  */
}

/*
void main(List<String> arguments) {
  /*
  var lista = ['Ana', 'Pedro', 'Ana'];
  lista.removeWhere((element) => element == "Ana");
  print(lista);
  */

  /*
  //type annotation
  var somenteStrings = <String>[];
  */

  /*
  List lista = [];
  print(lista.runtimeType);
  lista.add(true);
  print(lista.runtimeType);
  lista.add("Ana");
  print(lista.runtimeType);
  */

  /*
  var nomes = ['Ana', 'Joao', 'Maria'];
  nomes.add('Cristina');
  nomes.insert(0, 'Ana Maria');
  nomes.insert(2, 'Pedro');
  nomes.insert(nomes.length, 'Jose'); //é a mesma coisa de fazer um nomes.add
  print(nomes);
  */

  /*
  var itensDiversos = ['Ana', true, 2, 2.5];
  print(itensDiversos.runtimeType);
  */

  /*
  //escreva um programa que some os numeros passados como argumentos na linha de comando e mostre o resultado
  var acumulador = 0;
  for (final valor in arguments) {
    acumulador = acumulador + int.parse(valor);
  }
  print(acumulador);
  print(arguments
      .map((e) => int.parse(e))
      .reduce((value, element) => value + element));
  */
}
*/
