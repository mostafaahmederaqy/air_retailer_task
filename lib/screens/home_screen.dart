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
    final userList = context.watch<HomeProvider>().foundUser;

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
                    itemCount: userList.length,
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
                                  badgeColor: userList[index].isOnline
                                      ? Colors.green
                                      : Colors.grey),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(userList[index].image),
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
                                        userList[index].name,
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(userList[index].email.substring(
                                          userList[index].email.indexOf('@')))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              userList[index].region + userList[index].mobile,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Text(
                              userList[index].zone,
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
