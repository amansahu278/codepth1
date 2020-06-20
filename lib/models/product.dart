import 'dart:math';
class Products{

  List<String> pdtNames = ['Product 1', 'Product 2', 'Product 3', 'Product 4','Product 5','Product 6','Product 7'];
  List<String> sourceNames = ['Source 1', 'Source  2', 'Source  3', 'Source  4','Source 5','Source 6','Source 7'];
  List<Product> _products = List<Product>();

  Products(){
    for( String pdt in pdtNames){
      for(String src in sourceNames){
        _products.add(Product(name: pdt, source: src, price: Random().nextDouble() * 100));
      }
    }
  }
  get products{
    return _products;
  }
  get faves{
    List<Product> fave = List<Product>();
    for(Product pdt in _products){
      if(pdt.isFav == true){
        fave.add(pdt);
      }
    }
    return fave;
  }

  void setFavourite(Product p){
    _products[_products.indexOf(p)].isFav = true;
  }

  void removeFavorite(Product p){
    _products[_products.indexOf(p)].isFav = false;
  }

}


class Product{
  String name;
  String source;
  double price;
  bool isFav = false;
  Product({this.name, this.source, this.price});
}