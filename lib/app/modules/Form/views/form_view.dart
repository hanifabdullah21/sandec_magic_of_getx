import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/form_controller.dart';

class FormView extends GetView<FormController> {
  InputDecoration decoration(String hint) => InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));

  String? Function(String?) validator = (value) {
    if (GetUtils.isNullOrBlank(value) == true) {
      return "Tidak boleh kosong";
    }
    return null;
  };

  SizedBox spacing = const SizedBox(
    height: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FormView'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                    controller: controller.nameController,
                    decoration: decoration("Masukkan Nama Komunitas"),
                    validator: validator),
                spacing,
                TextFormField(
                    controller: controller.descriptionController,
                    decoration: decoration("Masukkan Deskripsi Komunitas"),
                    keyboardType: TextInputType.multiline,
                    validator: validator),
                spacing,
                TextFormField(
                    controller: controller.dateController,
                    onTap: () async {
                      controller.openDatePicker();
                    },
                    readOnly: true,
                    decoration: decoration("Pilih tanggal lahir komunitas"),
                    validator: validator),
                spacing,
                ElevatedButton(
                    onPressed: () {
                      if (!controller.formKey.currentState!.validate()) return;
                      controller.saveCommunity();
                    },
                    child: Text("SIMPAN"))
              ],
            )),
      ),
    );
  }
}
