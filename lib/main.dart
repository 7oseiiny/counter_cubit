import 'package:flutter/material.dart';

import 'bloc_cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(pointsCounter());
}

class pointsCounter extends StatelessWidget {
  void addOnePoint() {
    print('add one point');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: Counter(),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  Counter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("ddddd");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Points Counter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Team E',
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    BlocConsumer<CounterCubit, CounterState>(
                      listener: (context, state) {
                        if (state is CounterA){
                          print("A");
                        }
                        if (state is CounterR){
                          print("R");
                        }
                      },
                      builder: (context, state) {
                        return Text(
                          '${BlocProvider.of<CounterCubit>(context).teamAPoints}',
                          style: TextStyle(
                            fontSize: 150,
                          ),
                        );
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(8),
                        primary: Colors.orange,
                        minimumSize: Size(150, 50),
                      ),
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context)
                            .team_increment(team: 'A', button_number: 1);
                      },
                      child: Text(
                        'Add 1 Point ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        minimumSize: Size(150, 50),
                      ),
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context)
                            .team_increment(team: 'A', button_number: 2);
                      },
                      child: Text(
                        'Add 2 Point',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        minimumSize: Size(150, 50),
                      ),
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context)
                            .team_increment(team: 'A', button_number: 3);
                      },
                      child: Text(
                        'Add 3 Point ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 500,
                child: VerticalDivider(
                  indent: 50,
                  endIndent: 50,
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
              Container(
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Team B',
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    BlocConsumer<CounterCubit, CounterState>(
                      listener: (context, state) {
                        if (state is CounterB){
                          print("B");
                        }
                        if (state is CounterR){
                          print("R");
                        }
                        },
                      builder: (context, state) {
                        return Text(
                          '${BlocProvider.of<CounterCubit>(context).teamBPoints}',
                          style: TextStyle(
                            fontSize: 150,
                          ),
                        );
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(8),
                        primary: Colors.orange,
                        minimumSize: Size(150, 50),
                      ),
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context)
                            .team_increment(team: 'B', button_number: 1);
                      },
                      child: Text(
                        'Add 1 Point ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        minimumSize: Size(150, 50),
                      ),
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context)
                            .team_increment(team: 'B', button_number: 2);
                      },
                      child: Text(
                        'Add 2 Point ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        minimumSize: Size(150, 50),
                      ),
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context)
                            .team_increment(team: 'B', button_number: 3);
                      },
                      child: Text(
                        'Add 3 Point ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(8),
              primary: Colors.orange,
              minimumSize: Size(150, 50),
            ),
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).teamAPoints = 0;
              BlocProvider.of<CounterCubit>(context).teamBPoints = 0;
              BlocProvider.of<CounterCubit>(context).emit(CounterR());
            },
            child: Text(
              'Reset',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
