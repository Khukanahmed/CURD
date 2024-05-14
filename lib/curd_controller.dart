import 'dart:convert';
import 'package:crud_app/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class AddNewScreen extends GetxController {
  final productName = TextEditingController();
  final productCode = TextEditingController();
  final img = TextEditingController();
  final unitPrice = TextEditingController();
  final qty = TextEditingController();
  final totalPrice = TextEditingController();
  bool isLoader = false;

  Future<void> addProduct() async {
    //isLoader = true;
    final responds = await post(
        Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct'),
        headers: {'Content-type': 'application/json'},
        body: jsonEncode({
          "Img": img.value.text,
          "ProductCode": productCode.text,
          "ProductName": productName.text,
          "TotalPrice": totalPrice.text,
          "UnitPrice": unitPrice.text,
          "Qty": qty.value.text,
        }));
    //print(responds.statusCode);
    if (responds.statusCode == 200) {
   //   print('object');
      isLoader = false;
      print(responds.statusCode);
      Get.back();
      Get.snackbar(
        'Create Successfully',
        'Congregation',
      );
      productCode.clear();
      productName.clear();
      qty.clear();
      unitPrice.clear();
      totalPrice.clear();
      img.clear();
    } else {
      Get.snackbar('Create Fail', 'Try Again');
    }
  }
}

class ViewDataController extends GetxController {
  RxList<dynamic> products = <Product>[].obs;
  final inProgress = false.obs;

  Future<void> getData() async {
    inProgress.value = true;
    final respons =
        await get(Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct'));
    final Map<String, dynamic> responsDecode = jsonDecode(respons.body);
    if (respons.statusCode == 200 && responsDecode['status'] == 'success') {
      responsDecode['data'].forEach((e) {
        products.add(Product(
            id: e['_id'],
            productName: e['ProductName'],
            productCode: e['ProductCode'],
            img: e['Img'],
            unitPrice: e['UnitPrice'],
            qty: e['Qty'],
            totalPrice: e['TotalPrice']));
        //products.refresh();
      });
      inProgress.value = false;
    }
  }
}

class DeleteDataController extends GetxController {
  Future<void> deleteData(id) async {
    final respons = await get(
        Uri.parse('https://crud.teamrabbil.com/api/v1/DeleteProduct/$id'));
    final Map<String, dynamic> responsDecode = jsonDecode(respons.body);
    if (respons.statusCode == 200 && responsDecode['status'] == 'success') {
      Get.snackbar('', 'Your Product Delete');
      // getData();
    }
  }
}

class UpdateController extends GetxController {
  var productName = TextEditingController();
  final productCode = TextEditingController();
  final img = TextEditingController();
  final unitPrice = TextEditingController();
  final qty = TextEditingController();
  final totalPrice = TextEditingController();

  productUpdate(id) async {
    final respons = await post(
        Uri.parse('https://crud.teamrabbil.com/api/v1/UpdateProduct/$id'),
        headers: {'Content-type': 'application/json'},
        body: jsonEncode({
          "Img": img.text,
          "ProductCode": productCode.text,
          "ProductName": productName.text,
          "Qty": qty.text,
          "TotalPrice": totalPrice.text,
          "UnitPrice": unitPrice.text
        }));
    print(respons.statusCode);
  }
}
