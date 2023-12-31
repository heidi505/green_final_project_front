class JoinReqDTO {
  final String username;
  final String password;
  final String email;
  String? tokenFCM;

  JoinReqDTO({
    required this.username,
    required this.password,
    required this.email,
    this.tokenFCM,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
        "tokenFCM": tokenFCM,
      };

// request에만 쓰니까 fromJson은 필요없다
}

class LoginReqDTO {
  final String email;
  final String password;

  LoginReqDTO({required this.email, required this.password});

  Map<String, dynamic> toJson() => {"email": email, "password": password};
}
