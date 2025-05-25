class SignUpModel {
  final String fistName;
  final String lastName;
  final String email;
  final String password;
  final String mobileNumber;
  final String deliveryAddress;

  SignUpModel(
      {required this.fistName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.mobileNumber,
      required this.deliveryAddress});


  Map<String, dynamic> toJson(){
    return {
      "first_name": fistName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "phone": mobileNumber,
      "city": deliveryAddress
    };
  }
}
