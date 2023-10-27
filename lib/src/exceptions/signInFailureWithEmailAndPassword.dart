class SignInFailureWithEmailAndPassword{

final String message;
SignInFailureWithEmailAndPassword([this.message="An Unknown Error Ocurred"]);
factory SignInFailureWithEmailAndPassword.code(String code){
  switch (code) {
    case "weak password":
      return SignInFailureWithEmailAndPassword("Please Enter a Strong Password");
    default:
      return SignInFailureWithEmailAndPassword();
  }
}
}