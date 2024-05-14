import 'package:crud_app/curd_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCreateScreen extends StatefulWidget {
  const AddCreateScreen({super.key});

  @override
  State<AddCreateScreen> createState() => _AddCreateScreenState();
}

class _AddCreateScreenState extends State<AddCreateScreen> {
  final formKey = GlobalKey<FormState>();
  ViewDataController viewData=Get.put(ViewDataController());
  AddNewScreen addNewScreenController = Get.put(AddNewScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Create New product',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ProductName',
                  style: TextStyle(fontSize: 16),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: addNewScreenController.productName,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Product Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'ProductCode',
                  style: TextStyle(fontSize: 16),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: addNewScreenController.productCode,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'ProductCode'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Product Code';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Img',
                  style: TextStyle(fontSize: 16),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: addNewScreenController.img,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'URL link'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Image link';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'UnitPrice',
                  style: TextStyle(fontSize: 16),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: addNewScreenController.unitPrice,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'UnitPrice'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Unit Price';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Qty',
                  style: TextStyle(fontSize: 16),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: addNewScreenController.qty,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Qty'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter quantity';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'TotalPrice',
                  style: TextStyle(fontSize: 16),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: addNewScreenController.totalPrice,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'TotalPrice'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Total Price';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                // Text(_ProductCode.text),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: addNewScreenController.isLoader
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            //side: BorderSide(color: Colors.red)
                          ))),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              addNewScreenController.addProduct();

                            }
                          },
                          child: const Text(
                            'ADD',
                            style: TextStyle(
                                color: Colors.white, letterSpacing: 1),
                          )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
