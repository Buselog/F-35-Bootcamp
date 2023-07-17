import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:f35/theme/pallete.dart';

import '../../features/detail/screens/detailScreen.dart';
import 'homepage.dart';

Widget cardCat(context) => Card(
      clipBehavior: Clip.antiAlias,
      color: Pallete.helperColor2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Ink.image(
                image: AssetImage('assets/images/tekirkedi.jpeg'),
                height: 240,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: Text(
                  'Kedi dostumuza yardım etmek ister misiniz?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16).copyWith(bottom: 0),
            child: Text(
              'Bacağı kırık kedimize yardım etmek ister misiniz?',
              style: TextStyle(fontSize: 16),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  child: Text(
                    'Yardım Et',
                    style: TextStyle(
                        color: Pallete.secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                  animal: "Kedi",
                                )));
                  }),
              TextButton(
                child: Text(''),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );

Widget cardDog(context) => Card(
      clipBehavior: Clip.antiAlias,
      color: Pallete.helperColor2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Ink.image(
                image: AssetImage('assets/images/sokak_kopegi.jpeg'),
                height: 240,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: Text(
                  'Köpek dostumuza yardım etmek ister misiniz?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16).copyWith(bottom: 0),
            child: Text(
              'Bacağı kırık köpeğimize yardım etmek ister misiniz?',
              style: TextStyle(fontSize: 16),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  child: Text(
                    'Yardım Et',
                    style: TextStyle(
                        color: Pallete.secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                  animal: "Köpek",
                                )));
                  }),
              TextButton(
                child: Text(''),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );

Widget cardBird(context) => Card(
      clipBehavior: Clip.antiAlias,
      color: Pallete.helperColor2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Ink.image(
                image: AssetImage('assets/images/karga.jpeg'),
                height: 240,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: Text(
                  'Karga dostumuza yardım etmek ister misiniz?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16).copyWith(bottom: 0),
            child: Text(
              'Bacağı kırık kargamıza yardım etmek ister misiniz?',
              style: TextStyle(fontSize: 16),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  child: Text(
                    'Yardım Et',
                    style: TextStyle(
                        color: Pallete.secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                  animal: "Karga",
                                )));
                  }),
              TextButton(
                child: Text(''),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );

Widget helpButton(context) => Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Card(
            color: Pallete.helperColor2,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Pallete.secondaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Yardım Et',
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(
                                animal: 'Kedi',
                              )));
                },
                subtitle: Text(
                    'Reklam izleyerek yardıma ihtiyacı olan sokak hayvanlarına yardım edebilirsiniz.'),
                leading: const Icon(
                  Icons.pets,
                  color: Pallete.secondaryColor,
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Pallete.secondaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
