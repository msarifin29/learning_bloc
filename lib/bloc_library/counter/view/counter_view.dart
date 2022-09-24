import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_unit_testing/bloc_library/counter/cubit/counter_cubit.dart';

import '../../../animation/animation.dart';
import '../../../main.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, count) {
          return Stack(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$count',
                      style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () =>
                              context.read<CounterCubit>().increment(),
                          icon: const Icon(Icons.add,
                              size: 30, color: Colors.white),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        IconButton(
                          onPressed: () =>
                              context.read<CounterCubit>().decrement(),
                          icon: const Icon(Icons.remove,
                              size: 30, color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
