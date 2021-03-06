import 'package:client/camera/camera.dart';
import 'package:client/model/shirt.dart';
import 'package:client/model/shoe.dart';
import 'package:client/util/animation.dart';
import 'package:client/util/transition.dart';
import 'package:flutter/material.dart';
import "../global/context.dart";



class Product extends StatefulWidget {
  final String image;
  final String id;
  final Map data;
  const Product({Key key, this.image, this.id, this.data}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {


  Widget getAddButton(){

    Function callback = (){
      Shop.of(context).removeFromCart(widget.data);
    };
    String text = "Remove from Cart";
    if(!Shop.of(context).cart.containsKey(widget.id)){
      callback = (){
        Shop.of(context).addToCart(widget.data);
      };
      text = "Add to Cart";
    }
    return RaisedButton(
    padding: EdgeInsets.all(10),
    onPressed: callback,
    color: Colors.white,
    textColor: Colors.black,
    child: Text(text,
    style:TextStyle(fontSize: 16)),
  );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Hero(
        tag: widget.id,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.image), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[400],
                    blurRadius: 10,
                    offset: Offset(0, 10))
              ]),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: FadeAnimation(
                    1,
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black.withOpacity(.9),
                            Colors.black.withOpacity(.0),
                          ])),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FadeAnimation(
                              1.3,
                              Text(
                                "Sneakers",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            height: 25,
                          ),
                          FadeAnimation(
                              1.4,
                              Text(
                                "Size",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              FadeAnimation(
                                  1.5,
                                  Container(
                                    width: 40,
                                    height: 40,
                                    margin: EdgeInsets.only(right: 20),
                                    child: Center(
                                        child: Text(
                                      '40',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  )),
                              FadeAnimation(
                                  1.45,
                                  Container(
                                    width: 40,
                                    height: 40,
                                    margin: EdgeInsets.only(right: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                        child: Text(
                                      '42',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                  )),
                              FadeAnimation(
                                  1.46,
                                  Container(
                                    width: 40,
                                    height: 40,
                                    margin: EdgeInsets.only(right: 20),
                                    child: Center(
                                        child: Text(
                                      '44',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  )),
                              FadeAnimation(
                                  1.47,
                                  Container(
                                    width: 40,
                                    height: 40,
                                    margin: EdgeInsets.only(right: 20),
                                    child: Center(
                                        child: Text(
                                      '46',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          FadeAnimation(
                              1.5,
                              Container(
                                height: 80,
                                child: Center(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(
                                                bottom: 10,
                                                left: 10,
                                                right: 10,
                                                top: 10),
                                            child: getAddButton()
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                bottom: 10,
                                                left: 10,
                                                right: 10,
                                                top: 10),
                                            child: RaisedButton(
                                              padding: EdgeInsets.all(10),
                                              onPressed: () {
                                                print(widget.data);
                                                if(widget.data["name"].toString().contains("Shirt")){
                                                  Shop.of(context).changeShirt(widget.data);
                                                }
                                                else{
                                                  Shop.of(context).changeShoe(widget.data);
                                                }
                                                Navigator.of(context).push(
                                                    NoTransition(
                                                        builder: (context) {
                                                  return CameraScreen();
                                                }));
                                              },
                                              color: Colors.white,
                                              textColor: Colors.black,
                                              child: Text('Try Now',
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
