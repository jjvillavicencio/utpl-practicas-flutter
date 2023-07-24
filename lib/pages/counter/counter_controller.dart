import 'package:get/get.dart';

class CounterController extends GetxController {
  // final counter = 0.obs;
  RxInt counter = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  increment() {
    counter.value = counter.value + 1;
    print(counter.value);
  }

  decrement() {
    counter.value = counter.value - 1;
    print(counter);
  }

  resetCounter() {
    counter.value = 0;
    print(counter);
  }
}
