// to convert the response into a non nullable object (model)

import 'package:advanced_flutter_course/app/extensions.dart';
import 'package:advanced_flutter_course/data/responses/responses.dart';
import 'package:advanced_flutter_course/domain/model.dart';

const EMPTY = "";
const ZERO = 0;


extension CustomerResponseMapper on CustomerResponse {
  Customer toDomain() {
    return Customer(
        id?.orEmpty() ?? EMPTY,
        name?.orEmpty() ?? EMPTY,
        numOfNotifications?.orZero() ?? ZERO);
  }
}

extension ContactsResponseMapper on ContactsResponse {
  Contacts toDomain() {
    return Contacts(email?.orEmpty() ?? EMPTY,
        phone?.orEmpty() ?? EMPTY, link?.orEmpty() ?? EMPTY);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse {
  Authentication toDomain() {

    return Authentication(customer?.toDomain(),
        contacts?.toDomain());
  }
}
