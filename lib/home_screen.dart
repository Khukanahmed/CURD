import 'package:crud_app/add_new_product_screen.dart';
import 'package:crud_app/curd_controller.dart';
import 'package:crud_app/product.dart';
import 'package:crud_app/update_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ViewDataController getController = Get.put(ViewDataController());
  DeleteDataController deleteController = Get.put(DeleteDataController());

  @override
  void initState() {
    super.initState();
    // print('I am initstate');
    getController.getData();
  }

  // void deletproduct(String? id) async {
  //   Response response = await get(
  //       Uri.parse('https://crud.teamrabbil.com/api/v1/DeleteProduct/$id'));
  //   final Map<String, dynamic> responseDecode = jsonDecode(response.body);
  //
  //   if (response.statusCode == 200 && responseDecode['status'] == "success") {
  //     print('object');
  //     // getproduct();
  //     products.clear();
  //   }
  //
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'CRUD',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  getController.getData();
                  getController.products.clear();
                },
                icon: const Icon(Icons.refresh, color: Colors.white))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddCreateScreen()));
          },
          child: const Icon(Icons.add),
        ),
        body: Obx(() {
          if (getController.inProgress.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            shrinkWrap: true,
            itemCount: getController.products.length,
            itemBuilder: (context, index) {
              return Column(children: [
                Obx(() {
                  return ListTile(
                    leading: Image.network(
                      getController.products[index].img,
                      errorBuilder: (_, __, ___) {
                        return const Icon(Icons.image);
                      },
                    ),
                    title: Text(getController.products[index].productName),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "P.Code: ${getController.products[index].productCode}"),
                            Text(
                                "P.Price: ${getController.products[index].totalPrice}"),
                            Text(
                                "Total Unit: ${getController.products[index].qty}"),
                          ],
                        ),
                        Container(
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.to(UpdateScreen(product: getController.products[index], number: 12,));
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    deleteController.deleteData(
                                        getController.products[index].id);
                                  },
                                  icon: Icon(
                                    Icons.delete_rounded,
                                    color: Colors.red,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
//                 trailing: Column(
//                   children: [
//                     Text("Price: ${products[index].UnitPrice ?? ''}/P"),
//                     Expanded(
//                       child: Wrap(children: [
//                         IconButton(
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           UpdateScreen(
//                                             Product: products[index],
//                                           )));
//                             },
//                             icon: const Icon(
//                               Icons.edit,
//                               color: Colors.green,
//                             )),
//                         IconButton(
//                             onPressed: () {
//                               deletproduct(products[index].id);
//                             },
//                             icon: const Icon(Icons.delete,
//                                 color: Colors.red)),
//                       ]),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//         separatorBuilder: (context, index) {
//           return const Divider();
//         },
//       ),
//     );
                  );
                })
              ]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          );
        }));
  }
}
