import 'package:codepth1/models/product.dart';
import 'package:codepth1/pages/details.dart';
import 'package:codepth1/pages/profile.dart';
import 'package:flutter/material.dart';

Products s;
List<Product> onWatch = new List<Product>();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  bool isLoading = true;
  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;
    });
    s = Products();
//    s.products.forEach((product){
//      products.add(customCard(product));
//    });
//    if(s.faves != null){
//      s.faves.forEach((product){
//        favProducts.add(customFav(product));
//      });
//    }
    setState(() {
      isLoading = false;
    });
  }

  customFav(Product product){
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Details(product)));
        },
        child: Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(10)
          ),
          child: ListTile(
            title: Text(product.name),
            subtitle: Text(product.source),
            leading: Text("\$ ${product.price.toStringAsFixed(product.price.truncateToDouble() == product.price ? 0 : 2)}"),
          ),
        ),
      ),
    );
  }

  customCard(Product product){
    bool isSelected = false;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Details(product)));
        },
        child: Container(
          height: 80,
          width: 200,
          decoration: BoxDecoration(
//            color: isSelecting ? Colors.blue : null,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black
            )
          ),
          child: ListTile(
             title: Text(product.name),
             subtitle: Text(product.source),
             leading: Text("\$ ${product.price.toStringAsFixed(product.price.truncateToDouble() == product.price ? 0 : 2)}",),
              trailing: IconButton(
                icon: product.isFav ? Icon(Icons.favorite, color: Colors.red,): Icon(Icons.favorite_border),
                onPressed: (){
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
                },
              )
          ),
        ),
      ),
    );
  }

  buildBody(){
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          Text("Favorites", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            height: 100,
            child: s.faves == null || s.faves.length == 0 ? Center(child: Text("No Favourites!")) : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: s.faves.length,
              itemBuilder: (context, index){
                return customFav(s.products[index]);
              },
            ),
          ),
          SizedBox(height: 10,),
          Text("Products", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          SizedBox(height: 10,),
          Expanded(
            child: Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: s.products.length,
                itemBuilder: (context, index){
                  return customCard(s.products[index]);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        centerTitle: true,
        title: Text("App",),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile()));
            },
            icon: Icon(Icons.account_circle),
          )
        ],
      ),
      body: isLoading ? Center(child: CircularProgressIndicator()) : buildBody(),
    );
  }
}
