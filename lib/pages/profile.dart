import 'package:codepth1/models/product.dart';
import 'package:codepth1/pages/details.dart';
import 'package:codepth1/pages/home.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
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
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.cancel),
              onPressed: (){
              }
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0, left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("ON watch:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: onWatch.length,
                  itemBuilder: (context, index){
                    return customFav(onWatch[index]);
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
