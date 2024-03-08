import 'package:flutter/material.dart';
import 'package:flutter_practice/model/model.dart';
import 'package:flutter_practice/view_model/dataVm.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class HelloScreen extends StatefulWidget {
  HelloScreen({super.key, required this.dataVM});
  DataViewModel dataVM;

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  // DataViewModel dataVM = Provider.of<DataViewModel>(context, listen: false);
  // @override
  // void initState() {
  //   super.initState();
  //   widget.dataVM.getData();
  // }
  late Future<List<Data>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = DataViewModel().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 40,
          ),
        ),
        actions: const [
          Row(
            children: [
              Icon(
                Icons.favorite_border,
                color: Colors.lightBlue,
                size: 30,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '0',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          )
        ],
      ),
      body: FutureBuilder(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.lightBlue,
              ));
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.asset('lib/assets/cat2.png'),
                      Text(
                        'Your Word: ${snapshot.data?[0].word.toUpperCase()}',
                        style: const TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        'For Audio References:',
                        style: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),
                      ),
                      Link(
                        uri: Uri.parse(
                            'https://api.dictionaryapi.dev/media/pronunciations/en/hello-au.mp3'),
                        builder: (context, followLink) {
                          return GestureDetector(
                            onTap: followLink,
                            child: const Text(
                              'Click here for audio',
                              style: TextStyle(
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.lightBlue,
                                color: Colors.blue,
                              ),
                            ),
                          );
                        },
                      ),

                      const Text(
                        'Meanings:',
                        style:  TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),
                      ),
                       Text(
                        textAlign: TextAlign.center,
                        '${snapshot.data?[0].meanings[0].definitions[0].definition}',
                        style: const TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),
                      ),
                       Text(
                        textAlign: TextAlign.center,
                        '${snapshot.data?[0].meanings[1].definitions[0].definition}',
                        style: const TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),
                      ),

                     
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
