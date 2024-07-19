Map<String,dynamic> getNewCartItem(Map<String, Object> product, int selectedSize){
  return {
    'id': product['id'],
    'title': product['title'],
    'price': product['price'],
    'imageUrl': product['imageUrl'],
    'company': product['company'],
    'size': selectedSize,
  };

}