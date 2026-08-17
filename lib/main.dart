import 'package:flutter/material.dart';
import 'dart:math'; // random class

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: const Color.fromRGBO(111, 78, 55, 1)),
      ),
      home: const MyHomePage(title: 'Frases do Dia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  List<String> listaValores = [
    "Você é capaz de conquistar muito mais do que imagina",
    "Cada tentativa te deixa mais perto do sucesso",
    "Acredite no seu potencial e continue avançando",
    "Pequenos passos também levam a grandes conquistas",
    "Não desista só porque está difícil",
    "Todo novo dia é uma oportunidade para recomeçar",
    "Seus esforços de hoje construirão seu futuro",
    "Continue mesmo quando os resultados demorarem a aparecer",
    "Você não precisa ser perfeito para começar",
    "Grandes conquistas começam com pequenas decisões",
    "Confie no processo e siga em frente",
    "Transforme seus desafios em oportunidades de crescimento",
    "Você já superou dias difíceis antes",
    "Seu futuro depende das escolhas que você faz hoje",
    "Não tenha medo de tentar algo novo",
    "A persistência transforma sonhos em resultados",
    "Cada erro é uma oportunidade para aprender",
    "Faça hoje algo que seu futuro agradecerá",
    "A disciplina te leva onde a motivação não consegue",
    "Você está mais perto do que estava ontem",
    "Não compare seu começo com o resultado de outra pessoa",
    "Grandes mudanças começam com pequenas atitudes",
    "Você pode aprender qualquer coisa com dedicação",
    "Continue avançando, mesmo que seja devagar",
    "O fracasso só acontece quando você deixa de tentar",
    "Seja paciente com seu próprio progresso",
    "Uma atitude positiva pode transformar seu dia",
    "Não espere pelo momento perfeito, comece agora",
    "Seu esforço nunca é completamente perdido",
    "Todo desafio traz consigo uma oportunidade",
    "Você é responsável por construir o caminho que deseja",
    "Não deixe o medo decidir por você",
    "A coragem começa quando você decide tentar",
    "Seu progresso merece ser reconhecido",
    "Não existe crescimento sem enfrentar desafios",
    "Você pode ir além dos limites que criou para si mesmo",
    "Cada dia é uma nova chance de melhorar",
    "Continue aprendendo, continue crescendo",
    "Os resultados aparecem para quem permanece constante",
    "Uma pequena evolução diária gera grandes resultados",
    "Acredite que você consegue e trabalhe para isso",
    "Não permita que um dia ruim defina sua jornada",
    "Você não precisa ter todas as respostas para continuar",
    "Transforme obstáculos em motivos para evoluir",
    "Começar novamente também é uma forma de coragem",
    "Valorize cada pequena conquista do caminho",
    "Seu maior concorrente é quem você era ontem",
    "Faça o melhor que puder com o que você tem hoje",
    "Não tenha medo de mudar seus planos para alcançar seus objetivos",
    "Persistência é continuar mesmo quando ninguém está olhando",
    "Você pode transformar dificuldades em aprendizado",
    "O primeiro passo pode ser pequeno, mas ainda é progresso",
    "Seja consistente com aquilo que deseja conquistar",
    "Não deixe uma dificuldade apagar todos os seus avanços",
    "Você tem potencial para construir algo incrível"
  ];

  int index = 54;
  String textoBotao = 'Gerar frase';
  String textoCentral = "Clique no botão abaixo para gerar sua frase do dia.";
  void _definirFrase() {    
    Random random = new Random();
    
    setState(() {
      index = random.nextInt(listaValores.length);
      textoCentral = listaValores[index];
      textoBotao = 'Gerar nova frase';
      
    });
  }  

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(111, 78, 55, 1),
        foregroundColor: Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,          
          children: [
            Image.asset('assets/images/logo-app.png',
                width: 220
              ),
            Column(
              children: [
                Text(
                  textoCentral,
                  textAlign: TextAlign.center,
                  style: TextStyle(                    
                    fontSize: 20,            
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),                       
          SizedBox(
            width: 220,
            height: 50,
            child: ElevatedButton(
              onPressed: _definirFrase,
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(111, 78, 55, 1),
              foregroundColor: Colors.white,
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
               ),
            ), 
            child: Text(
              textoBotao,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold 
              ),)),           
          )
          ],
        ),
      ),      
    );
  }
}
