import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandec_magic_of_getx/app/repository/ApiProvider.dart';

class FormController extends GetxController {
  ApiProvider repository = Get.find();

  //Handle component inside Form Widget
  final formKey = GlobalKey<FormState>();

  //Controller for handle and set text to TextFormField
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();

  openDatePicker() async {
    DateTime? picker = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1997),
        lastDate: DateTime(2050));
    if (picker != null) {
      //If you want to format date, add intl packages
      //(https://pub.dev/packages/intl/install)
      dateController.text = picker.toString();
    }
  }

  saveCommunity() {
    Get.defaultDialog(
        content: CircularProgressIndicator(),
        barrierDismissible: false,
        title: "Loading...");
    repository
        .postNew(nameController.text, descriptionController.text,
            dateController.text)
        .then((value) {
      Get.back(); //close loading dialog
      Get.defaultDialog(
          title: value.success == true ? "Berhasil" : "Gagal",
          middleText: value.message ?? "",
          onConfirm: () {
            nameController.clear();
            descriptionController.clear();
            dateController.clear();
            Get.back();
          });
    });
  }
}
