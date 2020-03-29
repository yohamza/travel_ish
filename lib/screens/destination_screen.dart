import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ish/models/activity_model.dart';
import 'package:travel_ish/models/destination_model.dart';

class DestinationScreen extends StatelessWidget {
  final Destination destination;

  DestinationScreen(this.destination);


  Text _buildRatingStars(int rating){
    String stars = '';
     stars = stars.padRight(rating, '⭐ ');
     stars.trim();
     return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      )
                    ]),
                child: Hero(
                  tag: destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                        iconSize: 30.0,
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                              color: Colors.black,
                              icon: Icon(Icons.search),
                              iconSize: 30.0,
                              onPressed: () => Navigator.pop(context)),
                          IconButton(
                              color: Colors.black,
                              icon: Icon(Icons.sort),
                              iconSize: 30.0,
                              onPressed: () => Navigator.pop(context)),
                        ],
                      )
                    ]),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      destination.city,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 35.0,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.locationArrow,
                          color: Colors.white70,
                          size: 15.0,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          destination.country,
                          style: TextStyle(color: Colors.white70, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20.0,
                right: 20.0,
                child: Icon(Icons.location_on,
                color: Colors.white70)
                )
            ],
          ),
          Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: destination.activities.length,
              itemBuilder: (BuildContext context, int index){
                Activity activity = destination.activities[index];
                return Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      height: 170.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            Container(
                              width: 120.0,
                              child: Text(activity.name, style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text('\$${activity.price}', style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,),
                                ),
                                Text('per pax', style: TextStyle(
                                color: Colors.grey),
                                ),
                              ],
                            )
                            ]),
                              Text(activity.type, style: TextStyle(
                                color: Colors.grey),
                                ),
                              _buildRatingStars(activity.rating),
                              SizedBox(height: 10.0),
                              Row(children: <Widget>[
                                Container(
                                  width: 70.0,
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(activity.startTimes[0],
                                  ), 
                                ),
                                SizedBox(width: 10.0),
                                 Container(
                                  width: 70.0,
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(activity.startTimes[1],
                                  ), 
                                )
                              ],)
                          ]
                        ),
                      )
                    ),
                    Positioned(
                      left: 20.0,
                      bottom: 15.0,
                      top: 15.0,
                      child: ClipRRect(borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        width: 110.0,
                        image: AssetImage(activity.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      ),
                    )
                  ]
                );
              }),
          )
        ],
      ),
    );
  }
}
