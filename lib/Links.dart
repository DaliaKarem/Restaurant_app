class linkapp{
  static const String linkServer="http://10.0.2.2/ecommerce";
  static const String test="$linkServer/test.php";

  //Auth
  static const String SignUp="$linkServer/auth/signup.php";
  static const String VerifyCode="$linkServer/auth/verifyCode.php";
  static const String login="$linkServer/auth/login.php";

  //ForgetPass
  static const String checkEmail="$linkServer/forgetPass/checkEmail.php";
  static const String VerifyCodePass="$linkServer/forgetPass/verifyCodePass.php";
  static const String resetPass="$linkServer/forgetPass/resetPass.php";

  //Home
  static const String home="$linkServer/home.php";
  static const String items="$linkServer/Items/items.php";
  //ProductDetails
static const String ProductDetails="$linkServer/ProductDetails.php";

//Fav
  static const String Fav="$linkServer/Fav/fav.php";
  static const String add_Fav="$linkServer/Fav/add_fav.php";
  static const String remove_Fav="$linkServer/Fav/remove_fav.php";
  static const String remove_From_FavPage="$linkServer/Fav/removeFromFav.php";

  //Cart
  static const String Cart="$linkServer/Cart/cart.php";
  static const String add_Cart="$linkServer/Cart/add_cart.php";
  static const String remove_Cart="$linkServer/Cart/remove_cart.php";
  static const String remove_From_CartPage="$linkServer/Cart/removeFromcart.php";
//http://localhost/ecommerce/forgetPass/checkEmail.php
}