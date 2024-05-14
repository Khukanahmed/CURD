import 'package:crud_app/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'curd_controller.dart';

class UpdateScreen extends StatefulWidget {
  final Product product;
  final int number;

  const UpdateScreen({
    super.key,
    required this.product,
    required this.number,
  });

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  // void update_data() async {
  //   Response response = await post(
  //       Uri.parse(
  //           'https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.Product.id}'),
  //       headers: {'Content-type': 'application/json'},
  //       body: jsonEncode({
  //         "Img": _img.text,
  //         "ProductCode": _productCode.text,
  //         "ProductName": _productName.text,
  //         "TotalPrice": _totalPrice.text,
  //         "UnitPrice": _unitPrice.text,
  //         "Qty": _qty.text,
  //       }));
  //
  //   if (response.statusCode == 200) {
  //     Navigator.pop(context);
  //   }
  // }

  UpdateController update = Get.put(UpdateController());

  final _fromKey = GlobalKey<FormState>();
  bool isprogess = false;

  @override
  void initState() {
    update.productName.text = widget.product.productName;
    update.totalPrice.text = widget.product.totalPrice;
    update.img.text = widget.product.img;
    update.unitPrice.text = widget.product.unitPrice;
    update.productCode.text = widget.product.productCode;
    update.qty.text = widget.product.qty;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Update Screen",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Form(
            key: _fromKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ProductName',
                  style: TextStyle(fontSize: 16),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: update.productName,
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
                  controller: update.productCode,
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
                  controller: update.img,
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
                  controller: update.unitPrice,
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
                  controller: update.qty,
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
                  controller: update.totalPrice,
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
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        //side: BorderSide(color: Colors.red)
                      ))),
                      onPressed: () async {
                        if (_fromKey.currentState!.validate()) {
                          update.productUpdate(widget.product.id);
                          Get.back();
                        }
                      },
                      child: const Text(
                        'UPDATE',
                        style: TextStyle(color: Colors.white, letterSpacing: 2),
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
