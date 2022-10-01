import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sandec_magic_of_getx/app/routes/app_pages.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MainView'),
          centerTitle: true,
        ),
        body: Container(
          height: Get.height,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.FORM)?.then((value){
                        controller.getCommunities();
                      });
                    },
                    child: Text("Tambah")),
              ),
              Obx(() {
                if (controller.isSuccess.value == true) {
                  if(controller.communities.isEmpty){
                    return emptyView();
                  }else{
                    return listView();
                  }
                } else {
                  return errorView();
                }
              })
            ],
          ),
        ));
  }

  errorView(){
    return Center(
      child: Column(
        children: [
          Image.asset("img_error.png"),
          Text("Gagal mendapatkan data komunitas"),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            controller.getCommunities();
          }, child: Text("Ulangi"))
        ],
      ),
    );
  }

  listView(){
    return Flexible(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.communities.value.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: Container(
                    width: Get.width,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${controller.communities.value[index]?.name}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            "${controller.communities.value[index]?.description}"),
                        Text(
                            "${controller.communities.value[index]?.bornDate}"),
                      ],
                    )));
          }),
    );
  }

  emptyView(){
    return Center(
      child: Column(
        children: [
          Image.asset("img_empty.png"),
          Text("Data Kosong")
        ],
      ),
    );
  }

}
