import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_unit_testing/animation/animation.dart';
import 'package:learning_unit_testing/bloc_library/counter/cubit/counter_cubit.dart';
import 'package:learning_unit_testing/bloc_library/infinite_list/post/posts.dart';
import 'package:learning_unit_testing/bloc_library/timer/timer.dart';

import 'bloc_library/counter/view/counter_view.dart';
import 'bloc_library/timer/ticker.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            return CounterCubit();
          },
        ),
        BlocProvider(
          create: (_) => TimerBloc(
            ticker: const Ticker(),
          ),
        ),
        BlocProvider(
          create: (_) => PostBloc(httpClient: http.Client())
            ..add(
              PostFetched(),
            ),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColorLight: Colors.blueGrey,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          Positioned(
            right: 50,
            bottom: 50,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.4,
              margin: const EdgeInsets.only(left: 50),
              child: const CustomAnimation3(
                child: Icon(
                  Icons.flutter_dash_outlined,
                  color: Colors.blue,
                  size: 100,
                ),
              ),
            ),
          ),
          Center(
            child: Wrap(
              spacing: 10.0,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CounterPage(),
                    ),
                  ),
                  child: const Text('Counter'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TimerView(),
                    ),
                  ),
                  child: const Text('Timer'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PostList(),
                    ),
                  ),
                  child: const Text('Infinite'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.blue.shade500,
            ],
          ),
        ),
      ),
    );
  }
}
