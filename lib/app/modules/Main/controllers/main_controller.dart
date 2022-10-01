import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandec_magic_of_getx/app/model/CommunityModel.dart';
import 'package:sandec_magic_of_getx/app/repository/ApiProvider.dart';

class MainController extends GetxController {

  ApiProvider repository = Get.find();

  final isSuccess = false.obs;
  RxList<CommunityModel?> communities = List<CommunityModel>.empty().obs;

  @override
  void onReady() {
    super.onReady();
    getCommunities();
  }

  @override
  void onInit() {
    super.onInit();
  }

  loading(){
    if(Get.isDialogOpen==true){
      Get.back();
    }else{
      Get.defaultDialog(
          content: CircularProgressIndicator(),
          barrierDismissible: false,
          title: "Loading...");
    }
  }

  void getCommunities() {
    loading();
    repository.getAll().then((value){
      loading();
      if(value.success==true){
        final list = List<CommunityModel>.from((value.result).map((u) => CommunityModel.fromJson(u)));
        isSuccess.value = true;
        communities.value = list;
      }else{
        isSuccess.value = false;
      }
    }, onError: (error){
      loading();
      isSuccess.value = false;
    });
  }
}
