class Auth0IdTokenModel {
  String? nickName;
  String? name;
  String? picture;
  String? updateAt;
  String? email;
  bool? isEmailVerified;
  String? iss;
  String? sub;
  String? aud;
  int? iat;
  int? exp;
  String? nounce;

  Auth0IdTokenModel(
      {this.nickName,
      this.name,
      this.picture,
      this.updateAt,
      this.email,
      this.isEmailVerified,
      this.iss,
      this.sub,
      this.aud,
      this.iat,
      this.exp,
      this.nounce});

  factory Auth0IdTokenModel.fromJson(Map<String, dynamic> map) {
    return Auth0IdTokenModel(
      nickName: map['nickname'],
      name: map['name'],
      picture: map['picture'],
      updateAt: map['updated_at'],
      email: map['email'],
      isEmailVerified: map['email_verified'],
      iss: map['iss'],
      sub: map['sub'],
      aud: map['aud'],
      iat: map['iat'],
      exp: map['exp'],
      nounce: map['nonce'],
    );
  }
}
