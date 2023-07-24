import 'package:get/get.dart';
import 'package:practicas/pages/counter/counter_controller.dart';

class CounterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CounterController>(
      () => CounterController(),
    );
  }
}
