import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> apiData;

    return FutureBuilder(future: fetchData(),builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting) {
        return SafeArea(child: Center(child: CircularProgressIndicator()));
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        apiData = snapshot.data;
        return SafeArea(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 20, mainAxisSpacing: 20),
                    itemCount: apiData.length,
                    itemBuilder:(context, index) {
                      String fullname = apiData['data'][index]['first_name'] +" "+ apiData['data'][index]['last_name'];
                      return ContactCardView(
                        name: fullname,
                        imgUrl: apiData['data'][index]['avatar'],
                        emailId: apiData['data'][index]['email'],
                      );
                    },
                  ),
                ),
              );
        // return Text("Data: ${snapshot.data}");
      }
    },);
  }

  //  API call function
  Future<dynamic> fetchData() async {
    const url = 'https://reqres.in/api/users?page=1';
    final api_response = await http.get(Uri.parse(url));

    if(api_response.statusCode == 200) {
      Map<String, dynamic> apiData = json.decode(api_response.body);
      return apiData;

    } else {
      throw Exception("Failed to load data");
    }
  }


}


class ContactCardView extends StatelessWidget {
  final String name;
  final String imgUrl;
  final String emailId;

  const ContactCardView({required this.name, required this.imgUrl, required this.emailId});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        // accessing device dimensions
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 3,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0,3,0,3),
                child: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  backgroundImage: NetworkImage('$imgUrl'),
                  radius: 40,
                ),
              ),
              Text("$name", style: TextStyle(fontSize: 12),),
              SizedBox(height: 4,),
              ElevatedButton(onPressed: () {
                final Uri email = Uri(scheme: 'mailto', path: '$emailId');
                _launchInEmailApp(email);
              }, child: Text("Send Email",style: TextStyle(fontSize: 12),),)
            ],
          ),
        ),
      ),
    );
  }


  Future<void> _launchInEmailApp(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }


}



