import 'package:covid_project/world_status.dart';
import 'package:flutter/material.dart';
class Details extends StatefulWidget {
   String country;
  int cases;
  int death;
  String flag;
  int  critic;
  int  totalRecovered;

 Details({required this.death,required this.totalRecovered,required this.cases,
  required this.country,required this.critic,required this.flag});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
     (
     appBar: AppBar(title: Text(widget.country.toString()),),
     body: SafeArea(child: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 10),
       child: Column(
       mainAxisAlignment: MainAxisAlignment.center,

       children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
           Padding(
             padding: const EdgeInsets.only(top: 50),
             child: Card(child: Column(children: [
               ReusableRow(title: "Death", value: widget.death.toString()),
               ReusableRow(title: "Cases", value: widget.cases.toString()),
               ReusableRow(title: "Critical", value: widget.critic.toString()),
               ReusableRow(title: "Total Recovered", value: widget.totalRecovered.toString()),
             ],),),
           ),
          CircleAvatar(backgroundImage: NetworkImage(widget.flag,),radius: 60,),


        ],)


    ],),
     ),),);
  }
}
