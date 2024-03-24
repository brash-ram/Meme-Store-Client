import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/bloc_state.dart';
import '../../../bloc/meme_bloc.dart';
import '../../model_bloc_selector.dart';
import '/data.dart';

@RoutePage()
class AddMemeScreen extends StatelessWidget {
  const AddMemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TestWidget();
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => TestWidgetState();
}

class TestWidgetState extends State<TestWidget> {
  String data = '';

  @override
  Widget build(BuildContext context) =>
    data != ''  ?  ElevatedButton(
                child: const Text('magic'),
                onPressed: () => setState(() {
                  data = '';
                }))   : BlocProvider(
      create: (context) => MemeBloc(context.read(), 1, 2),
      child: BlocBuilder<MemeBloc, BlocState<Meme>>(
        builder: (context, state) =>
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
    
              // ModelBlocSelector<MemeBloc, Meme,String>(
              //   selector: (value) => value.description,
              //   builder: (context, state) => 
              //     Text(state.toString()),
              // ),
              ModelBlocSelector<MemeBloc, Meme, String>(
                bloc: context.read<MemeBloc>(),
                selector: (value) => value.description,
                builder: (context, state) => 
                  Text(state.toString()),
              ),
              // BlocSelector<MemeBloc, BlocState<Meme>, BlocState<String>>(
              //   selector: (state) => state.select((value) => value.description),
              //   builder: (context, state) => 
              //     Text(state.toString()),
              // ),
              switch(state) {
                BlocStateWithValue() => Text('Data!'),
                BlocStateInitial() => Text('First load...'),
                BlocStateError() => Text('ERROR!'),
              },
              Text(state.value?.description ?? '<no description>'),
              Text('Current BLoC state: ${state.runtimeType}'),
              Text(
                state.toString(),
                maxLines: 100,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Consolas',
                ),
              ),
                          ElevatedButton(
                child: const Text('magic'),
                onPressed: () => setState(() {
                  data='d';
                }),
              ),
              ElevatedButton(
                child: const Text('update'),
                onPressed: () async => context.read<MemeBloc>().update(),
              ),
              ElevatedButton(
                child: const Text('invalidate'),
                onPressed: () async => context.read<MemeBloc>().reset(),
              ),
              ElevatedButton(
                child: const Text('DEBUG: add error'),
                onPressed: () async => context.read<MemeBloc>().debugAddError(),
              ),
              // Text(data),
              //         ElevatedButton(
              //   child: Text("Leak"),
              //   onPressed: () async {
              //     {
              //       final stream = repo.getMeme(1,2);
              //       StreamSubscription<Meme>? sub;
              //       sub = stream.listen(
              //         (event) async {
              //           print('leak: $event');
              //         },
              //         // ignore: avoid_types_on_closure_parameters
              //         onError: (Object e) async {
              //           print(' leakex: $e');
              //         },
              //       );
              //     }}
              //         ),
              // ElevatedButton(
              //   child: Text("TEST"),
              //   onPressed: () async {
              //     {
              //       final stream = repo.getMeme(1,2);
              //       StreamSubscription<Meme>? sub;
              //       sub = stream.listen(
              //         (event) async {
              //           print('ev: $event');
              //           await sub!.cancel();
              //         },
              //         // ignore: avoid_types_on_closure_parameters
              //         onError: (Object e) async {
              //           print('ex: $e');
              //         await sub!.cancel();
              //         },
              //       );
              //     }
              //     // {
              //     //   final stream = repo.getMeme(1,2);
              //     //   StreamSubscription<Meme>? sub;
              //     //   sub = stream.listen(
              //     //     (event) async {
              //     //       print('ev2: $event');
              //     //       await sub!.cancel();
              //     //     },
              //     //     // ignore: avoid_types_on_closure_parameters
              //     //     onError: (Object e) async {
              //     //       print('ex2: $e');
              //     //     await sub!.cancel();
              //     //     },
              //     //   );
              //     // }
              //   },
              // )
            ],
          ),
      ),
    );
}
