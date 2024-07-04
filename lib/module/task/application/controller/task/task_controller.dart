import 'package:bizkit/utils/constants/contants.dart';
import 'package:get/get.dart';

class CreateTaskController extends GetxController {
  Rx<TaskType> createTaskTupe = TaskType.official.obs;
  Rx<PriorityLevel> createPriorityLevel = PriorityLevel.medium.obs;
  Rx<RecurringTimePeriod> createRecurringTimePeriod =
      RecurringTimePeriod.none.obs;
  RxBool createRecurring = false.obs;
  RxString deadlineDate = ''.obs;

  changeTaskType(TaskType type) {
    createTaskTupe.value = type;
  }

  changePriorityLevel(PriorityLevel level) {
    createPriorityLevel.value = level;
  }

  changeRecurringTimePeriod(RecurringTimePeriod period) {
    createRecurringTimePeriod.value = period;
  }

  changeCreateRecorring(bool value) {
    createRecurring.value = value;
  }
}
