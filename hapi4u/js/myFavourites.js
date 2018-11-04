
var saveMyFavourites = function(user_id, pharmacy_id) {
  var fdao = Java.type("com.sivajavatechie.script.MyFavouritesDAO")
  fdao.saveMyFavourites( user_id, pharmacy_id)
}

var deleteMyFavourites = function(user_id, pharmacy_id) {
  var fdao = Java.type("com.sivajavatechie.script.MyFavouritesDAO")
  fdao.deleteMyFavourites( user_id, pharmacy_id)
}
