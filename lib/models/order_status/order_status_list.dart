// To parse this JSON data, do
//
//     final orderstatuslist = orderstatuslistFromJson(jsonString);

import 'dart:convert';

Orderstatuslist orderstatuslistFromJson(String str) => Orderstatuslist.fromJson(json.decode(str));

String orderstatuslistToJson(Orderstatuslist data) => json.encode(data.toJson());

class Orderstatuslist {
  final bool? success;
  final int? count;
  final List<Order>? orders;

  Orderstatuslist({
    this.success,
    this.count,
    this.orders,
  });

  factory Orderstatuslist.fromJson(Map<String, dynamic> json) => Orderstatuslist(
    success: json["success"],
    count: json["count"],
    orders: json["orders"] == null ? [] : List<Order>.from(json["orders"]!.map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "count": count,
    "orders": orders == null ? [] : List<dynamic>.from(orders!.map((x) => x.toJson())),
  };
}

class Order {
  final ShippingAddress? shippingAddress;
  final String? id;
  final String? user;
  final List<OrderItem>? orderItems;
  final String? contactNumber;
  final String? orderNumber;
  final int? totalAmount;
  final DateTime? deliveryDate;
  final String? userName;
  final String? status;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Order({
    this.shippingAddress,
    this.id,
    this.user,
    this.orderItems,
    this.contactNumber,
    this.orderNumber,
    this.totalAmount,
    this.deliveryDate,
    this.userName,
    this.status,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    shippingAddress: json["shippingAddress"] == null ? null : ShippingAddress.fromJson(json["shippingAddress"]),
    id: json["_id"],
    user: json["user"],
    orderItems: json["orderItems"] == null ? [] : List<OrderItem>.from(json["orderItems"]!.map((x) => OrderItem.fromJson(x))),
    contactNumber: json["contactNumber"],
    orderNumber: json["orderNumber"],
    totalAmount: json["totalAmount"],
    deliveryDate: json["deliveryDate"] == null ? null : DateTime.parse(json["deliveryDate"]),
    userName: json["userName"],
    status: json["status"],
    paymentType: json["paymentType"],
    isPaid: json["isPaid"],
    isDelivered: json["isDelivered"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "shippingAddress": shippingAddress?.toJson(),
    "_id": id,
    "user": user,
    "orderItems": orderItems == null ? [] : List<dynamic>.from(orderItems!.map((x) => x.toJson())),
    "contactNumber": contactNumber,
    "orderNumber": orderNumber,
    "totalAmount": totalAmount,
    "deliveryDate": deliveryDate?.toIso8601String(),
    "userName": userName,
    "status": status,
    "paymentType": paymentType,
    "isPaid": isPaid,
    "isDelivered": isDelivered,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class OrderItem {
  final Product? product;
  final Name? name;
  final int? quantity;
  final int? price;
  final int? totalPrice;

  OrderItem({
    this.product,
    this.name,
    this.quantity,
    this.price,
    this.totalPrice,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    product: productValues.map[json["product"]]!,
    name: nameValues.map[json["name"]]!,
    quantity: json["quantity"],
    price: json["price"],
    totalPrice: json["totalPrice"],
  );

  Map<String, dynamic> toJson() => {
    "product": productValues.reverse[product],
    "name": nameValues.reverse[name],
    "quantity": quantity,
    "price": price,
    "totalPrice": totalPrice,
  };
}

enum Name {
  OLIVE
}

final nameValues = EnumValues({
  "Olive": Name.OLIVE
});

enum Product {
  THE_68_CA6748_A97_C83_C87_C6_C1_D37
}

final productValues = EnumValues({
  "68ca6748a97c83c87c6c1d37": Product.THE_68_CA6748_A97_C83_C87_C6_C1_D37
});

class ShippingAddress {
  final String? address;
  final String? city;
  final String? postalCode;
  final String? country;

  ShippingAddress({
    this.address,
    this.city,
    this.postalCode,
    this.country,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) => ShippingAddress(
    address: json["address"],
    city: json["city"],
    postalCode: json["postalCode"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "city": city,
    "postalCode": postalCode,
    "country": country,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
