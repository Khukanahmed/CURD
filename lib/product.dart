class Product {
  final String id;
  final String productName;
  final String productCode;
  final String img;
  final String unitPrice;
  final String qty;
  final String totalPrice;

  Product(
      {required this.id,
      required this.productName,
      required this.productCode,
      required this.img,
      required this.unitPrice,
      required this.qty,
      required this.totalPrice});
}














// class product {
//   final String? id,
//       ProductName,
//       ProductCode,
//       Image,
//       UnitPrice,
//       quantiy,
//       TotalPrice,
//       CreatedDate;
//
//   product(
//       {this.id,
//       this.ProductName,
//       this.ProductCode,
//       this.Image,
//       this.UnitPrice,
//       this.quantiy,
//       this.TotalPrice,
//       this.CreatedDate});
//
//   factory product.toJeson(Map<String, dynamic> e) {
//     return product(
//         id: e['_id'],
//         ProductName: e['ProductName'],
//         ProductCode: e['ProductCode'],
//         Image: e['Img'],
//         UnitPrice: e['UnitPrice'],
//         quantiy: e['Qty'],
//         TotalPrice: e['TotalPrice'],
//         CreatedDate: e['']);
//   }
// }
//
