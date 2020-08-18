import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[500],
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset("images/long_pencil.jpg", fit: BoxFit.fitHeight),
          ),
          Positioned(
            child: Text(
              "Todo List",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            top: 50,
            left: 10,
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.85,
            builder:
                (BuildContext context, ScrollController scrollerController) {
              return Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.0),
                        topLeft: Radius.circular(50.0),
                      ),
                    ),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            "To do list $index",
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "Detail To do list  $index",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.normal),
                          ),
                          trailing: Icon(
                            Icons.check_circle,
                            color: Colors.greenAccent,
                          ),
                          isThreeLine: true,
                        );
                      },
                      itemCount: 20,
                      controller: scrollerController,
                    ),
                  ),
                  Positioned(
                    child: FloatingActionButton(
                      child: Icon(Icons.add, color: Colors.white),
                      backgroundColor: Colors.deepOrange,
                    ),
                    top: -10,
                    right: 40,
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
