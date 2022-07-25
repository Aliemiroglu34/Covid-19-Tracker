import 'package:covid_project/api_service.dart';
import 'package:covid_project/countries.dart';
import 'package:covid_project/model/WorldModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatus extends StatefulWidget {
  const WorldStatus({Key? key}) : super(key: key);

  @override
  State<WorldStatus> createState() => _WorldStatusState();
}

class _WorldStatusState extends State<WorldStatus> {
  var colorList = [Colors.red, Colors.blue, Colors.green];
  ApiService _apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              FutureBuilder(
                  future: _apiService.getWorldStatus(),
                  builder: (context, AsyncSnapshot<WorldModel?> snapshot) {
                    if (snapshot.hasData) {
                      final dataMap = <String, double>{
                        "Total": double.parse(snapshot.data!.cases.toString()),
                        "Deaths":
                            double.parse(snapshot.data!.deaths.toString()),
                        "Recovered":
                            double.parse(snapshot.data!.recovered.toString()),
                      };
                      return Column(
                        children: [
                          PieChart(
                            dataMap: dataMap,
                            colorList: [
                              Colors.red,
                              Colors.blue,
                              Colors.green,
                            ],
                            animationDuration: Duration(seconds: 2),
                            chartType: ChartType.ring,
                            legendOptions: LegendOptions(
                                legendPosition: LegendPosition.left),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ReusableRow(
                              title: "Total",
                              value: snapshot.data!.cases.toString()),
                          ReusableRow(
                              title: "Deaths",
                              value: snapshot.data!.deaths.toString()),
                          ReusableRow(
                              title: "Recovered",
                              value: snapshot.data!.recovered.toString()),
                          ReusableRow(
                              title: "Active",
                              value: snapshot.data!.active.toString()),
                          ReusableRow(
                              title: "Today Deaths",
                              value: snapshot.data!.todayDeaths.toString()),
                          ReusableRow(
                              title: "Today Recovered",
                              value: snapshot.data!.todayRecovered.toString()),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(()=>Countries());
                              },
                              child: Text("Track Countries",
                                  style: TextStyle(fontSize: 20)),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
                            ),
                          )
                        ],
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  late final String title, value;
  ReusableRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 25, color: Colors.green),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 25, color: Colors.green[300]),
          )
        ],
      ),
    );
  }
}
