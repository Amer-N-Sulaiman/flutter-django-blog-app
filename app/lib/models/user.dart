class User{
  String email;
  String username;
  String firstname;
  String lastname;
  String password;
  String password2;

  User({this.email, this.username, this.firstname, this.lastname, this.password, this.password2});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['email'], username: json['username'], firstname: json['firstname'], lastname: json['lastname'], password: json['password'], password2: json['password2']);
  }
  dynamic toJson() => {'email': email, 'username': username, 'firstname': firstname, 'lastname': lastname, 'password': password, 'password2': password2};
}