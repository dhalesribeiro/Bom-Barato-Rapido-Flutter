// Deus Seja Louvado
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bom Barato e Rápido',
      home: Scaffold(
        body: BomBaratoRapido(),
      ),
    );
  }
}

class BomBaratoRapido extends StatefulWidget {
  const BomBaratoRapido({super.key});

  @override
  State<BomBaratoRapido> createState() => _BomBaratoRapidoState();
}

class _BomBaratoRapidoState extends State<BomBaratoRapido> {
  // Mapeia quais os Switch foram ativados
  Map<String, bool> switchs = {'bom': false, 'barato': false, 'rapido': false};

  // Ativa os Switch quando true sendo: setSwitchs[0] como Switch 'bom'
  List setSwitchs = [false, false, false];

  // conta quantos Switchs estão ativados 0 a 3
  int isTrue = 0;

  // Chamado quando os Switchs são ativandos ou desativados
  void change(name, val) {
    // Guarda os indices dos Switchs que receberam true
    List ids = [];

    // Guarda os indices dos Switchs que podem ser desativados
    List disables = [];

    // verifica se os Switchs ativados é maior que 2
    if (isTrue > 2) {
      switchs.forEach((key, value) {
        // verifica em Switchs qual deles recebeu true
        if (switchs[key] == true) {
          // os Switchs que receberem true tem seu id armazenados em ids
          ids.add(key);
        }
      });

      // Faz um loop em ids e adiciona em disables os idices corretos de cada Switch
      for (var i = 0; i < ids.length; i++) {
        if (ids[i] == 'bom') {
          disables.add(0);
        } else if (ids[i] == 'barato') {
          disables.add(1);
        } else if (ids[i] == 'rapido') {
          disables.add(2);
        }
      }

      // Faz um sorteio entre os numeros 0 e 1
      var sort = Random().nextInt(2);

      // Notificando o framework que os estados dos objetos foram alterados
      setState(() {
        // Desativa o Switch sorteado
        setSwitchs[disables[sort]] = false;

        // Restaura o numero Switchs que estão ativados para 2
        isTrue = 2;

        // Modifica em switchs com o indice correto qual Switch recebeu false no sorteio
        if (disables[sort] == 0) {
          switchs['bom'] = false;
        } else if (disables[sort] == 1) {
          switchs['barato'] = false;
        } else if (disables[sort] == 2) {
          switchs['rapido'] = false;
        }
      });
    }

    // Mantem o ultimo Switch selecionado como true
    switchs[name] = val;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 189, 187, 240),
            Color.fromARGB(255, 240, 240, 240),
          ],
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Como você deseja seu Projeto?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 6, 38, 32)),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                SizedBox(
                  width: 150,
                  child: Row(
                    children: [
                      Switch.adaptive(
                        activeColor: const Color.fromARGB(255, 255, 117, 160),
                        activeTrackColor: const Color.fromARGB(255, 219, 102, 141),
                        inactiveTrackColor: const Color.fromARGB(255, 155, 155, 155),
                        inactiveThumbColor: const Color.fromARGB(255, 207, 207, 207),
                        value: setSwitchs[0],
                        onChanged: (bool value) {
                          setState(() {
                            setSwitchs[0] = value;
                            value ? ++isTrue : --isTrue; // se value for true acrescenta 1 em isTrue
                            change('bom', value);
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      const Text('Bom', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 6, 38, 32))),
                    ],
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Row(
                    children: [
                      Switch.adaptive(
                        activeColor: const Color.fromARGB(255, 255, 199, 68),
                        activeTrackColor: const Color.fromARGB(255, 243, 182, 75),
                        inactiveTrackColor: const Color.fromARGB(255, 155, 155, 155),
                        inactiveThumbColor: const Color.fromARGB(255, 207, 207, 207),
                        value: setSwitchs[1],
                        onChanged: (bool value) {
                          setState(() {
                            setSwitchs[1] = value;
                            value ? ++isTrue : --isTrue; // se value for true acrescenta 1 em isTrue
                            change('barato', value);
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      const Text('Barato', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 6, 38, 32))),
                    ],
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Row(
                    children: [
                      Switch.adaptive(
                        activeColor: const Color.fromARGB(255, 58, 208, 173),
                        activeTrackColor: const Color.fromARGB(255, 58, 181, 156),
                        inactiveTrackColor: const Color.fromARGB(255, 155, 155, 155),
                        inactiveThumbColor: const Color.fromARGB(255, 207, 207, 207),
                        value: setSwitchs[2],
                        onChanged: (bool value) {
                          setState(() {
                            setSwitchs[2] = value;
                            value ? ++isTrue : --isTrue; // se value for true acrescenta 1 em isTrue
                            change('rapido', value);
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      const Text('Rápido', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 6, 38, 32))),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'By Dhales Ribeiro',
              style: TextStyle(color: Color.fromARGB(140, 6, 38, 32)),
            ),
          ],
        ),
      ),
    );
  }
}
