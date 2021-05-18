import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/businness_logic/cubit/counter_cubit.dart';
import 'package:untitled/presentation/pages/second_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //le Bloclistener ecoute le stream et excecute une fonction
      //il ne rafraichis pas l'ecran , il faut l'utiliser pour des operations de logique
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // Le blocBuilder lui par contre rafraichi l'ecran et passe la valeur actuel au state
            //BlocListener et BlocBuilder sont compris dans BlocConsumer
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                // TODO: implement listener}
                if (state.wasIncremented == true) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Incremented"),
                    duration: Duration(microseconds: 300),
                  ));
                }
              },
              builder: (context, state) {
                return Text(
                  '${state.counterValue}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment(10);
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                  heroTag: "btn234",

                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                  heroTag: "btn23",

                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                    onPressed: () {
                      //go to secondScreen
                      // ici la seconde page va crasher si on ne donne pas
                      // l'instance du bloc provider actuel a la page suivante
                      // il est donc neccessaire d'utiliser un BlocProvider.value
                      ////////ANONYMOUS NAVIGATION WITH BLOCPROVIDER
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (ctx) => BlocProvider.value(
                      //         value: BlocProvider.of<CounterCubit>(context),
                      //         child: SecondPage(title: "second Page"))));

                      /////NAMED NAVIGATION WITH BLOCPRIDER , VOIR LE MAIN au niveau des routes
                      Navigator.of(context).pushNamed("/second");
                    },
                    child: Text("Go to next page"))
              ],
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
