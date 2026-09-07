import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<Map<String, dynamic>> perguntas = [
    {
      'pergunta': 'Qual é o maior planeta do Sistema Solar?',
      'respostas': ['Terra', 'Marte', 'Júpiter', 'Saturno'],
      'correta': 'Júpiter',
    },
    {
      'pergunta': 'Qual é a capital da França?',
      'respostas': ['Londres', 'Paris', 'Roma', 'Madri'],
      'correta': 'Paris',
    },
    {
      'pergunta': 'Quantos continentes existem no mundo?',
      'respostas': ['5', '6', '7', '8'],
      'correta': '7',
    },
    {
      'pergunta': 'Qual é o maior oceano do mundo?',
      'respostas': ['Atlântico', 'Índico', 'Pacífico', 'Ártico'],
      'correta': 'Pacífico',
    },
    {
      'pergunta': 'Quem pintou a Mona Lisa?',
      'respostas': [
        'Vincent van Gogh',
        'Pablo Picasso',
        'Leonardo da Vinci',
        'Michelangelo',
      ],
      'correta': 'Leonardo da Vinci',
    },
    {
      'pergunta': 'Qual é o símbolo químico do ouro?',
      'respostas': ['Ag', 'Au', 'Fe', 'O'],
      'correta': 'Au',
    },
    {
      'pergunta': 'Qual país é conhecido como Terra do Sol Nascente?',
      'respostas': ['China', 'Japão', 'Coreia do Sul', 'Tailândia'],
      'correta': 'Japão',
    },
    {
      'pergunta': 'Quantos lados possui um hexágono?',
      'respostas': ['5', '6', '7', '8'],
      'correta': '6',
    },
    {
      'pergunta': 'Qual é o maior animal terrestre?',
      'respostas': [
        'Girafa',
        'Rinoceronte',
        'Hipopótamo',
        'Elefante-africano'
      ],
      'correta': 'Elefante-africano',
    },
    {
      'pergunta': 'Em qual continente fica o Egito?',
      'respostas': ['África', 'Ásia', 'Europa', 'América'],
      'correta': 'África',
    },
  ];

  int acertos = 0;
  int perguntaAtual = 0;

  String? respostaSelecionada;
  bool respondeu = false;
  bool quizFinalizado = false;

  void selecionarResposta(String resposta) {
    if (!respondeu) {
      setState(() {
        respostaSelecionada = resposta;
      });
    }
  }

  void responder() {
    if (respostaSelecionada == null) {
      return;
    }

    setState(() {
      respondeu = true;

      if (respostaSelecionada == perguntas[perguntaAtual]['correta']) {
        acertos++;
      }
    });
  }

  void proximaPergunta() {
    setState(() {
      if (perguntaAtual < perguntas.length - 1) {
        perguntaAtual++;
        respostaSelecionada = null;
        respondeu = false;
      } else {
        quizFinalizado = true;
      }
    });
  }

  void jogarNovamente() {
    setState(() {
      perguntaAtual = 0;
      acertos = 0;
      respostaSelecionada = null;
      respondeu = false;
      quizFinalizado = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: quizFinalizado
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Quiz finalizado!',
                      style: TextStyle(fontSize: 24),
                    ),

                    const SizedBox(height: 20),

                    Text('Pontuação final: $acertos'),

                    Text('Acertos: $acertos'),

                    Text('Erros: ${perguntas.length - acertos}'),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: jogarNovamente,
                      child: const Text('Jogar novamente'),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pergunta ${perguntaAtual + 1} de ${perguntas.length}',
                    ),

                    const SizedBox(height: 20),

                    Text(
                      perguntas[perguntaAtual]['pergunta'],
                      style: const TextStyle(fontSize: 20),
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        selecionarResposta(
                          perguntas[perguntaAtual]['respostas'][0],
                        );
                      },
                      child: Text(
                        perguntas[perguntaAtual]['respostas'][0],
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        selecionarResposta(
                          perguntas[perguntaAtual]['respostas'][1],
                        );
                      },
                      child: Text(
                        perguntas[perguntaAtual]['respostas'][1],
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        selecionarResposta(
                          perguntas[perguntaAtual]['respostas'][2],
                        );
                      },
                      child: Text(
                        perguntas[perguntaAtual]['respostas'][2],
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        selecionarResposta(
                          perguntas[perguntaAtual]['respostas'][3],
                        );
                      },
                      child: Text(
                        perguntas[perguntaAtual]['respostas'][3],
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      respostaSelecionada == null
                          ? 'Nenhuma alternativa selecionada'
                          : 'Selecionada: $respostaSelecionada',
                    ),

                    const SizedBox(height: 20),

                    if (!respondeu)
                      ElevatedButton(
                        onPressed: responder,
                        child: const Text('Responder'),
                      ),

                    if (respondeu)
                      Text(
                        respostaSelecionada ==
                                perguntas[perguntaAtual]['correta']
                            ? 'Resposta correta!'
                            : 'Resposta incorreta!',
                      ),

                    if (respondeu)
                      ElevatedButton(
                        onPressed: proximaPergunta,
                        child: Text(
                          perguntaAtual == perguntas.length - 1
                              ? 'Ver resultado'
                              : 'Próxima pergunta',
                        ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}