import 'package:cubit_statemanagement/constants/router_constants.dart';
import 'package:cubit_statemanagement/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: "Increment",
              onPressed: counterCubit.increment,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            SizedBox.fromSize(size: const Size(10, 10),),
            FloatingActionButton(
              heroTag: "Decrement",
              onPressed: counterCubit.decrement,
              tooltip: 'Decrement',
              child: const Icon(Icons.minimize),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.replaceNamed(RouterConstants.home);
        },
        heroTag: "Back Page",
        tooltip: 'Back Page',
        child: const Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
