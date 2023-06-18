class RegModel{
  final String email;
  final String username;
  final String password;

  RegModel({required this.email, required this.username, required this.password});

  Map<String, dynamic> toJson()=>{
    "email":email,
    "username":username,
    "password":password
  };
}