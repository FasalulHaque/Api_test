import 'package:api_test2/fetch.dart';
import 'package:api_test2/model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('ApiTestCase'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<TestCase>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 30, crossAxisSpacing: 9),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Column(children: [
                  Image.network(snapshot.data![index].image),
                  Text(snapshot.data![index].name.toString()),
                  Text(snapshot.data![index].creationAt.toString()),
                ]);
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
