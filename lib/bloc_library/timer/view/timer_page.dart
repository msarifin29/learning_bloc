import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_unit_testing/bloc_library/timer/bloc/timer_bloc.dart';

import '../../../animation/animation.dart';
import '../../../main.dart';

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Center(
                    child: TimerText1(),
                  ),
                ),
                Actions(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TimerText1 extends StatelessWidget {
  const TimerText1({super.key});

  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final minutesStr =
        ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return Text(
      '$minutesStr:$secondsStr',
      style:
          Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white),
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
        buildWhen: (previous, state) =>
            previous.runtimeType != state.runtimeType,
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (state is TimerInitial) ...[
                FloatingActionButton(
                  onPressed: () => context.read<TimerBloc>().add(
                        TimerStarted(duration: state.duration),
                      ),
                  child: const Icon(Icons.play_arrow),
                ),
              ],
              if (state is TimerRunInProgress) ...[
                FloatingActionButton(
                  child: const Icon(Icons.pause),
                  onPressed: () => context.read<TimerBloc>().add(
                        const TimerPaused(),
                      ),
                ),
                FloatingActionButton(
                  child: const Icon(Icons.replay),
                  onPressed: () => context.read<TimerBloc>().add(
                        const TimerReset(),
                      ),
                ),
              ],
              if (state is TimerRunPause) ...[
                FloatingActionButton(
                  child: const Icon(Icons.play_arrow),
                  onPressed: () => context.read<TimerBloc>().add(
                        const TimerResumed(),
                      ),
                ),
                FloatingActionButton(
                  child: const Icon(Icons.replay),
                  onPressed: () => context.read<TimerBloc>().add(
                        const TimerReset(),
                      ),
                ),
              ],
              if (state is TimerRunComplete) ...[
                FloatingActionButton(
                  child: const Icon(Icons.replay),
                  onPressed: () => context.read<TimerBloc>().add(
                        const TimerReset(),
                      ),
                ),
              ]
            ],
          );
        });
  }
}
