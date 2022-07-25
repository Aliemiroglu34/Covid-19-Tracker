import 'dart:developer';

import 'package:covid_project/api_service.dart';
import 'package:covid_project/controller.dart';
import 'package:covid_project/details.dart';
import 'package:covid_project/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Countries extends StatefulWidget {
  const Countries({Key? key}) : super(key: key);

  @override
  State<Countries> createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  var _controller = Get.find<Controller>();
  ApiService _service = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                    future: _service.getCountries(),
                    builder: (context, AsyncSnapshot<List<dynamic>?> snapshot) {
                      return ListView.builder(
                          itemCount: _controller.isLoading
                              ? 10
                              : snapshot.data!.length,
                          itemBuilder: (context, index) {
                            if (_controller.isLoading) {
                              return ShimmerTile();
                            } else {
                              return ListTile(
                                onTap: (){
                                            var data=snapshot.data![index];

                                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                     Details(death: data["deaths"], totalRecovered: data["recovered"],
                                         cases: data["cases"], country: data["country"],
                                         critic: data["critical"], flag: data["countryInfo"]["flag"])));
                                  print(snapshot.data![index]["deaths"]);
                                },
                                leading: SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: Image(
                                      image: NetworkImage(
                                          snapshot.data![index]["countryInfo"]
                                              ["flag"]),
                                    )),
                                title: Text(snapshot.data![index]["country"]),
                                subtitle: Text(snapshot.data![index]["cases"].toString()),
                              );
                            }
                          });
                    }),
              ),
            ],
          ),
        ));
  }
}

Widget ShimmerTile() {
  return ListTile(
    title: ShimmerWidget.fromRectangular(
        height: 16, shapeBorder: const RoundedRectangleBorder()),
    subtitle: ShimmerWidget.fromRectangular(
        height: 14, shapeBorder: const RoundedRectangleBorder()),
    leading: ShimmerWidget.circle(
        width: 35, height: 35, shapeBorder: const RoundedRectangleBorder()),
  );
}
