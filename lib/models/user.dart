class User{
  final String first_name;
  final String last_name;
  final String full_name;
  final String image;
  final String email;
  final String password;
  final String phone;
  final bool isSuperAdmin;

  User({
    this.first_name = "",
    this.last_name = "",
    this.image = "",
    this.email = "",
    this.password = "",
    this.phone = "",
    this.isSuperAdmin = false,
    this.full_name = ""
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      first_name: json["first_name"],
      last_name: json["last_name"],
      image: json["image"],
      email: json["email"],
      password: json["password"],
      phone: json["phone"],
      isSuperAdmin: json["isSuperAdmin"],
      full_name: json["first_name"] + json["last_name"],
    );
  }

  Map<String, dynamic> toJSon(){
    Map<String, dynamic> data = {
      "first_name": this.first_name,
      "last_name": this.last_name,
      "image": this.image,
      "email": this.email,
      "password": this.password,
      "phone": this.phone,
      "isSuperAdmin": this.isSuperAdmin,
    };
    return data;
  }
}