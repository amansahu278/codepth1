import 'package:codepth1/models/product.dart';
import 'package:codepth1/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {

  Product p;
  Details(this.p);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  List<Product> prods = List();
  bool isLoading = true;

  void getProducts() async {
    setState(() {
      isLoading = true;
    });
    await s.products.forEach((product){
      if(product.name == widget.p.name){
        prods.add(product);
      }
    });
    setState(() {
      isLoading = false;
      prods.sort((Product a, Product b){
        return (a.price - b.price).floor();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  customFav(Product product){
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Details(product)));
        },
        child: Container(
          height: 70,
          width: 100,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(10)
          ),
          child: ListTile(
            title: Text(product.source),
            leading: Text("\$ ${product.price.toStringAsFixed(product.price.truncateToDouble() == product.price ? 0 : 2)}"),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.p.name),
        actions: <Widget>[
          IconButton(
            icon: widget.p.isFav ? Icon(Icons.favorite, color: Colors.white,) : Icon(Icons.favorite_border),
              onPressed: (){
              Product product = widget.p;
                SnackBar ss;
                setState(() {
                  if(product.isFav){
                    s.removeFavorite(product);
                    ss = SnackBar(content: Text("Removed from favourites!"), duration: Duration(milliseconds: 300),);
                  } else {
                    s.setFavourite(product);
                    ss = SnackBar(content: Text("Added to favourites!"), duration: Duration(milliseconds: 300),);
                  }
                });
                _key.currentState.showSnackBar(ss);
                print(s.faves);
              }
          )
        ],
      ),
      body: isLoading ? CircularProgressIndicator() : Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Theme.of(context).accentColor,
                  child: Text("IMG", style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: prods.length,
                    itemBuilder: (context, index){
                      return customFav(prods[index]);
                    },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
