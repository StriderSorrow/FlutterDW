class ConfirmModel{
  final String code;
  final String emailCode;

  ConfirmModel({required this.code, required this.emailCode});

  Map<String,dynamic> toJson()=>{
    "code":code,
    "emailCode":emailCode,
  };
}