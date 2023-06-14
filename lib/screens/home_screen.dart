import 'package:air_retailer_task/providers/home_provider.dart';
import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    final personList = context.watch<HomeProvider>().foundUser;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
               TextField(
                onChanged: (value) => context.read<HomeProvider>().runFilter(value),
                decoration: const InputDecoration(
                    labelText: 'Search', suffixIcon: Icon(Icons.search)),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: personList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            badge.Badge(
                              position: badge.BadgePosition.bottomEnd(
                                  bottom: 10, end: 10),
                              badgeStyle: badge.BadgeStyle(
                                  borderRadius: BorderRadius.circular(10),
                                  badgeColor: personList[index].active == "true"
                                      ? Colors.green
                                      : Colors.grey),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(personList[index].photo),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xffD8D7DB),
                                    borderRadius: BorderRadius.circular(10)),
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        personList[index].email.substring(
                                            0,
                                            personList[index]
                                                .email
                                                .indexOf('@')),
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(personList[index].email.substring(
                                          personList[index].email.indexOf('@')))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              personList[index].mobile,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Text(
                              personList[index].state,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
