import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:practicas/pages/counter/counter_controller.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CounterController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                '${ctrl.counter.value}',
                style: const TextStyle(
                  fontSize: 120,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.indigo,
                  width: 2,
                ),
                foregroundColor: Colors.indigo,
              ),
              onPressed: () {
                ctrl.resetCounter();
              },
              icon: const Icon(Icons.settings_backup_restore),
              label: const Text('Reiniciar'),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: 'decrement',
            backgroundColor: Colors.indigo,
            onPressed: () {
              ctrl.decrement();
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: 'increment',
            backgroundColor: Colors.indigo,
            onPressed: () {
              ctrl.increment();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
