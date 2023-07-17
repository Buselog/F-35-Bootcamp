import 'package:f35/core/providers/firebase_providers.dart';
import 'package:f35/features/add_pet/screens/addPetScreen.dart';
import 'package:f35/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:f35/theme/pallete.dart';
import 'package:f35/home/screens/card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.whiteColor,
        elevation: 0,
        leading: Container(
            margin: EdgeInsets.all(6),
            child: Icon(Icons.pets, color: Pallete.primaryColor)),
        title: Container(
          height: 35,
          decoration: BoxDecoration(
            border: Border.all(color: Pallete.secondaryColor, width: 1.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                child: Icon(
                  Icons.search,
                  color: Pallete.secondaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  'Search',
                  style: TextStyle(color: Pallete.secondaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          helpButton(context),
          cardCat(context),
          SizedBox(height: 10),
          cardDog(context),
          SizedBox(height: 10),
          cardBird(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPetScreen()));
        },
        backgroundColor: Pallete.secondaryColor,
        child: Icon(
          Icons.add,
          color: Pallete.whiteColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Pallete.primaryColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  color: Pallete.whiteColor,
                )),
            SizedBox(
              width: 210,
            ),
            IconButton(
                onPressed: () {
                  ref.read(authControllerProvider).signOut(context);
                },
                icon: Icon(
                  Icons.logout,
                  color: Pallete.whiteColor,
                )),
          ],
        ),
      ),
    );
  }
}
